# auth.py

from flask import Blueprint, render_template, redirect, url_for, request, flash
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user, login_required, current_user
from models import User, Itinerary, Location
from app import db
from sqlalchemy import desc
from datetime import datetime, timedelta  
#from dateutil.parser import parse

auth = Blueprint('auth', __name__)

@auth.route('/login')
def login():
    return render_template('login.html')

@auth.route('/login', methods=['POST'])
def login_post():
    email = request.form.get('email')
    password = request.form.get('password')
    remember = True if request.form.get('remember') else False

    user = User.query.filter_by(email=email).first()

    # check if the user actually exists
    # take the user-supplied password, hash it, and compare it to the hashed password in the database
    if not user or not check_password_hash(user.password, password):
        flash('Please check your login details and try again.')
        return redirect(url_for('auth.login')) # if the user doesn't exist or password is wrong, reload the page

    # if the above check passes, then we know the user has the right credentials
    login_user(user, remember=remember)
    return redirect(url_for('main.profile', id=current_user.id, username=current_user.name))

@auth.route('/signup')
def signup():
    return render_template('signup.html')

@auth.route('/signup', methods=['POST'])
def signup_post():
    # code to validate and add user to database goes here
    name = request.form.get('name')
    password = request.form.get('password')
    email = request.form.get('email')

    user = User.query.filter_by(email=email).first() # if this returns a user, then the email already exists in database

    if user: # if a user is found, we want to redirect back to signup page so user can try again
        flash('Email address already exists')
        return redirect(url_for('auth.signup'))

    # create a new user with the form data. Hash the password so the plaintext version isn't saved.
    new_user = User(email=email, name=name, password=generate_password_hash(password, method='sha256'))

    # add the new user to the database
    db.session.add(new_user)
    db.session.commit()

    return redirect(url_for('auth.login'))

@auth.route('/delete', methods=['POST'])
def delete_post():
    # code to validate and delete user from database
    email = request.form.get('email')
    password = request.form.get('password')

    user = User.query.filter_by(email=email).first()
    
    if user and check_password_hash(user.password, password): # if the user is found, we want to redirect back to main page
        flash('Account Deleted!')
        db.session.delete(user)
        db.session.commit()
        return redirect(url_for('main.index'))
    
    flash('Please check your credentials and try again.')
    return redirect(url_for('main.profile', id=current_user.id, username=current_user.name)) # if the user enters wrong credentials, reload the page

#Route to list of all of the user's itineraries
@auth.route('/itinerary')
@login_required
def itinerary():
    itineraries = Itinerary.query.filter_by(user_id = current_user.id).all()
    return render_template('itinerary.html', itineraries=itineraries, name=current_user.name)

#Route to the sub-page for the specific itinerary ID
@auth.route('/itinerary/<itin_id>', methods=['GET'])
@login_required
def edit_itinerary(itin_id):
    #Get the selected itinerary from the database and return it to the new page
    selected_itin = Itinerary.query.filter_by(user_id=current_user.id, id=itin_id).first()
    locations = selected_itin.locations.order_by(Location.departure_time)
    print("Hello from edit!")
    return render_template('edit_itinerary.html', itinerary=selected_itin, locations=locations)

@auth.route('/itinerary/<itin_id>', methods=['POST'])
@login_required
def name_itinerary(itin_id):
    cur_itin = Itinerary.query.filter_by(id=itin_id).first()
    cur_itin.nickname = request.form.get('name')
    db.session.commit()
    return redirect(url_for('auth.edit_itinerary', itin_id=itin_id))

#Route to the sub-page for the specific itinerary ID
@auth.route('/itinerary/<itin_id>/delete', methods=['POST'])
@login_required
def delete_location(itin_id):
    #Delete the selected location from the selected itinerary
    print("Hello from delete location!")
    loc_id = request.args['loc_id']
    selected_itin = Itinerary.query.filter_by(user_id=current_user.id, id=itin_id).first()
    print(selected_itin.locations.filter_by(id=loc_id).first().address)
    location_to_delete = selected_itin.locations.filter_by(id=loc_id).first()
    if location_to_delete:
        flash('Location deleted from itinerary!')
        db.session.delete(location_to_delete)
        db.session.commit()
        return redirect(url_for('auth.edit_itinerary', itin_id=itin_id))
    else:
        flash('ERROR: Location not found!')

    return redirect(url_for('auth.itinerary'))

#Route to list of all of the user's itineraries
@auth.route('/itinerary', methods=['POST'])
@login_required
def delete_itinerary():
    itin_id = request.args['itin_id']
    print(itin_id)
    
    itin_to_delete = Itinerary.query.filter_by(user_id = current_user.id, id=itin_id).first()
    if itin_to_delete:
        flash('Itinerary Deleted!')
        db.session.delete(itin_to_delete)
        db.session.commit()
        return redirect(url_for('auth.itinerary'))
    else:
        flash('ERROR: Itinerary not found!')
    
    return redirect(url_for('auth.itinerary'))


@auth.route('/start', methods=['POST'])
@login_required
def start_post():

    # create a new itinerary with the form data.
    new_itinerary = Itinerary(user_id = current_user.id, nickname="NULL")

    # add the new itinerary to the database
    db.session.add(new_itinerary)
    db.session.commit()
    return render_template('address.html', first_address=True)

@auth.route('/add', methods=['POST'])
@login_required
def add_location():
    itin_id = request.args['itin_id']
    cur_itin = Itinerary.query.filter_by(id=itin_id).first()
    cur_itin.modified = datetime.now()
    db.session.commit()
    return render_template('address.html', first_address=False)

@auth.route('/address')
@login_required
def address():
    return render_template('address.html')

@auth.route('/address', methods=['POST'])
@login_required
def address_post():
    address = request.form.get('ship-address')
    city = request.form.get('locality')
    state = request.form.get('state')
    zip = request.form.get('postcode')
    country = request.form.get('country')
    departure_string = request.form.get('departure_time')
    if departure_string.find("AM") != -1:
        departure_dt = datetime.strptime(departure_string, '%m/%d/%Y %H:%M %p')
    else:
        departure_dt = datetime.strptime(departure_string, '%m/%d/%Y %H:%M %p')
        departure_dt = departure_dt + timedelta(hours=12)

    nickname = request.form.get('nickname')
    if nickname == "":
        nickname="NULL"

    # create a new location with the form data.
    valid_itineraries = Itinerary.query.filter_by(user_id=current_user.id).order_by(desc(Itinerary.modified))
    curr_itinerary = valid_itineraries.first()
    new_location = Location(itinerary_id = curr_itinerary.id, order=1, nickname=nickname, address=address, city=city, state=state, zip=zip, country=country, departure_time=departure_dt)

    # add the new location to the database
    db.session.add(new_location)
    db.session.commit()
    #redirect to itinerary page
    return redirect(url_for('auth.edit_itinerary', itin_id=curr_itinerary.id))

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('main.index'))

