from app import db

class Utente(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(50), nullable=False)
    cognome = db.Column(db.String(50), nullable=False)
    data_nascita = db.Column(db.Date, nullable=False)
    nome_utente = db.Column(db.String(50), unique=True, nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(100), nullable=False)
    immagine_profilo = db.Column(db.String(255))

class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    utente_id = db.Column(db.Integer, db.ForeignKey('utente.id'), nullable=False)
    testo = db.Column(db.String(255))
    immagine = db.Column(db.String(255))
    video = db.Column(db.String(255))
    data_ora = db.Column(db.TIMESTAMP, server_default=db.func.current_timestamp())
    utente = db.relationship('Utente', backref=db.backref('posts', lazy=True))

class Commento(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    post_id = db.Column(db.Integer, db.ForeignKey('post.id'), nullable=False)
    utente_id = db.Column(db.Integer, db.ForeignKey('utente.id'), nullable=False)
    testo = db.Column(db.String(255))
    data_ora = db.Column(db.TIMESTAMP, server_default=db.func.current_timestamp())
    utente = db.relationship('Utente', backref=db.backref('commenti', lazy=True))
