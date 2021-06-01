# models.py

from flask_login import UserMixin
from app import db
from datetime import datetime

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True) # primary keys are required by SQLAlchemy
    email = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))
    name = db.Column(db.String(1000))
    #this makes a link back to user from the itinerary, so you can trace back to the user from an itinerary
    itineraries = db.relationship('Itinerary', backref='owner_user', lazy=True)

class Itinerary(db.Model):
    id = db.Column(db.Integer, primary_key=True) # primary keys are required by SQLAlchemy
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    nickname = db.Column(db.String(1000))
    #modified is how we're going to tell which is the current itinerary
    modified = db.Column(db.DateTime, nullable=False, default=datetime.now)
    #this makes a link back to itinerary from the location, so you can trace back to the itinerary from a location
    locations = db.relationship('Location', backref='owner_itinerary', lazy='dynamic')

    def __repr__(self):
        return '<Itinerary %r>' % self.id
        
class Location(db.Model):
    id = db.Column(db.Integer, primary_key=True) # primary keys are required by SQLAlchemy
    nickname = db.Column(db.String(1000))
    itinerary_id = db.Column(db.Integer, db.ForeignKey('itinerary.id'))
    order = db.Column(db.Integer, autoincrement=True)
    address = db.Column(db.String(1000))
    city = db.Column(db.String(1000))
    state = db.Column(db.String(1000))
    zip = db.Column(db.Integer)
    country = db.Column(db.String(1000))
    departure_time = db.Column(db.DateTime)

    def __repr__(self):
        return "Location: '{self.order}': '{self.address}'"