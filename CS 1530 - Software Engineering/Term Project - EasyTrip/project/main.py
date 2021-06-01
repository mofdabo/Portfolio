# main.py

from flask import Blueprint, render_template
from flask_login import login_required, current_user
from models import User, Itinerary, Location

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('index.html')

@main.route('/profile/<id>/<username>')
@login_required
def profile(id, username):
    itineraries = Itinerary.query.filter_by(user_id = current_user.id).all()
    return render_template('profile.html', name=username, itineraries=itineraries)