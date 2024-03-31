CONNECTION_STRING = "sqlite:///Rezervacije.db"
from flask import *
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import *
from sqlalchemy.orm import *

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = CONNECTION_STRING
db = SQLAlchemy(app)

#modeli

class Hotel(db.Model):
    IdHot = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Naziv = db.Column(db.String(50), nullable=False)
    Sobe = db.relationship("Soba", back_populates = "Hotel")

class Cenovnik(db.Model):
    IdHot = db.Column(db.Integer, db.ForeignKey('hotel.IdHot'), primary_key=True)
    TipSobe = db.Column(db.String(1), primary_key=True)
    CenaPoNocenju = db.Column(db.Float, nullable=False)

class Soba(db.Model):
    IdSob = db.Column(db.Integer, primary_key=True, autoincrement=True)
    BrojSobe = db.Column(db.Integer, nullable=False)
    BrojKreveta = db.Column(db.Integer, nullable=False)
    Tip = db.Column(db.String(1), nullable=False)
    IdHot = db.Column(db.Integer, db.ForeignKey('hotel.IdHot'), nullable=False)
    Hotel = db.relationship("Hotel", back_populates="Sobe")

class Korisnik(db.Model):
    IdKor = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ImePrezime = db.Column(db.String(50), nullable=False)
    Rezervacije = db.relationship('Rezervacija', back_populates='Korisnik')

class Rezervacija(db.Model):
    IdRez = db.Column(db.Integer, primary_key=True, autoincrement=True)
    DatumOd = db.Column(db.String(10), nullable=False)
    DatumDo = db.Column(db.String(10), nullable=False)
    BrNocenja = db.Column(db.Integer, nullable=False)
    OsnovnaCena = db.Column(db.Float, nullable=False)
    Status = db.Column(db.String(1), nullable=False)
    IdKor = db.Column(db.Integer, db.ForeignKey('korisnik.IdKor'), nullable=False)
    IdSob = db.Column(db.Integer, db.ForeignKey('soba.IdSob'), nullable=False)
    Korisnik = db.relationship('Korisnik', back_populates='Rezervacije')

class Uplata(db.Model):
    IdUpl = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Datum = db.Column(db.String(10), nullable=False)
    Iznos = db.Column(db.Float, nullable=False)
    IdRez = db.Column(db.Integer, db.ForeignKey('Rezervacija.IdRez'), nullable=False)

class Kupon(db.Model):
    IdKup = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Popust = db.Column(db.Float, nullable=False)
    MaksBrUpotreba = db.Column(db.Integer, nullable=False)
    Upotrebe = db.relationship('PrimenjujeSe', back_populates='Kupon')

class PrimenjujeSe(db.Model):
    __tablename__ = "primenjujeSe"
    IdKup = db.Column(db.Integer, db.ForeignKey('kupon.IdKup'), primary_key=True)
    IdRez = db.Column(db.Integer, db.ForeignKey('rezervacija.IdRez'), primary_key=True)
    Kupon = db.relationship('Kupon', back_populates='Upotrebe')

#kraj modeli
@app.route('/')
def pocetna():
    return "RADIIII"

@app.route('/korisnik/bez_rezervacije', methods=['GET'])
def z1():
      korisnici_bez_rezervacija = Korisnik.query.filter(~Korisnik.Rezervacije.any()).all()

      svi_bez = [{"IdKor": korisnik.IdKor, "ImePrezime": korisnik.ImePrezime} for korisnik in korisnici_bez_rezervacija]
      return jsonify(svi_bez)

@app.route('/kupon/upotrebljivi', methods=['GET'])
def z2():
    kuponi = Kupon.query.filter(func.length(Kupon.Upotrebe)<Kupon.MaksBrUpotreba).all()
    svi_bez = [{"IdKup": kupon.IdKup, "Velicina": "mali" if kupon.Popust<10 else ("veliki" if kupon.Popust>25 else "srednji") } for kupon in kuponi]
    return jsonify(svi_bez)

@app.route('/kupon/vezane_rezervacije', methods=['GET'])
def z3():
    korisnik = request.args.get("IdKor")
    Rez2 = aliased(Rezervacija)
    rezz = Rezervacija.query.join(Rez2, Rez2.DatumOd == Rezervacija.DatumDo).filter(Rezervacija.IdKor == korisnik).first()
   
    resp = {"IdKor": korisnik, "ImePrezime": (Korisnik.query.filter(Korisnik.IdKor == korisnik).first()).ImePrezime, "Ima":"da" if rezz else "ne"}
    return jsonify(resp)

@app.route('/hotel/pregled', methods=['GET'])
def z4():
    upit = db.session.query(Hotel.IdHot, Hotel.Naziv, Soba.Tip, db.func.count('tip'=='S').label("st"), db.func.count('tip'=='L').label("lu"), db.func.count('tip'=='E').label("ek")).join(Soba).group_by(Hotel.IdHot).all()
    res = [{"IdKup": hotel.IdHot, "Naziv":hotel.Naziv, "BrE":hotel.ek, "BrS":hotel.st, "BrL":hotel.lu} for hotel in upit]
    return jsonify(res)

@app.route('/korisnik/rezervisi', methods=['POST'])
def z5():
    try:
        podaci = request.json
        rezervacija = Rezervacija()
        rezervacija.BrNocenja = podaci["BrNocenja"]
        rezervacija.DatumDo = podaci["DatumDo"]
        rezervacija.DatumOd = podaci["DatumOd"]
        rezervacija.OsnovnaCena = podaci["OsnovnaCena"]
        rezervacija.Status = "R"
        rezervacija.IdKor = podaci["IdKor"]
        rezervacija.IdSob = podaci["IdSob"]
        db.session.add(rezervacija)
        db.session.commit()
        return jsonify({"message":"Uspeh"})
    except Exception as e:
        return jsonify({"message":"Greska"})
    


@app.route('/statistika/lojalnost', methods=['GET'])
def z6():
    korisnici = request.args.getlist("korisnici[]")
    hotel = request.args.get("hotel")
    prosek = db.session.query(db.func.avg(Rezervacija.BrNocenja)).join(Soba).filter(Soba.IdHot == hotel).subquery()
    res = db.session.query(Rezervacija.IdKor,(db.func.sum(Rezervacija.BrNocenja)>prosek).label("vece")).group_by(Rezervacija.IdKor).filter(Rezervacija.IdKor.in_(korisnici)).all()
    res_idkors = set(r.IdKor for r in res)
    resp = [{"IdKor": kor, "Status": "da" if int(kor) in res_idkors else "ne"} for kor in korisnici]
    return jsonify(resp)


@app.route('/korisnik/pretraga', methods=['GET'])
def z7():

    upit = Hotel.query
    if(request.args.get("Naziv")):
        upit = upit.filter(Hotel.Naziv.like( f"%{request.args.get('Naziv')}%" ))
    
    if(request.args.get("BrKr")):
        upit = upit.filter(Hotel.Sobe.any(Soba.BrojKreveta == int(request.args.get("BrKr"))))

    result = upit.all()
    resp = [{"IdHot": hot.IdHot, "Naziv": hot.Naziv} for hot in result]
    return jsonify(resp)


if __name__ == "__main__":
    app.run(debug = True)