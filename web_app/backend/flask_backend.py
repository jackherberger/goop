import os
import firebase_admin
from firebase_admin import db
from firebase_admin import credentials
from flask import Flask, render_template, request, redirect, url_for, session

app = Flask(__name__)

cred = credentials.Certificate("credentials.json")
firebase_admin.initialize_app(cred, {"databaseURL" : "https://goop-tech-default-rtdb.firebaseio.com"})

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        ref = db.reference("goop/")
        users_ref = ref.child("users")
        users_ref.set({
            request.form['username'] : {
                'date_of_birth' : request.form['dob'],
                'fname' : request.form['fname'],
                'lname' : request.form['lname']
            }
        })
        return redirect(url_for('index'))
    return render_template('signup.html')

@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        ref = db.reference("goop/")
        users_ref = ref.child("users")
        check = users_ref.child(request.form['username']).get()
        if check:
            session['username'] = request.form['username']
            return redirect(url_for('profile'))
        return redirect(url_for('login'))
    return render_template('login.html')

@app.route("/logout")
def logout():
    session.pop('username', None)
    return redirect(url_for('index'))

@app.route("/profile")
def profile():
    if 'username' in session:
        ref = db.reference("goop/")
        users_ref = ref.child("users")
        check = users_ref.child(session['username']).get()
        return render_template('profile.html', user=check)
    return redirect(url_for('login'))



if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(host="0.0.0.0", port=8080, debug=True)
