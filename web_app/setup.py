import firebase_admin
from firebase_admin import db
from firebase_admin import credentials

cred = credentials.Certificate("credentials.json")
firebase_admin.initialize_app(cred, {"databaseURL" : "https://goop-tech-default-rtdb.firebaseio.com"})

ref = db.reference("goop/")

users_ref = ref.child("users")

users_ref.set({
    'JackHerberger' : {
        'date_of_birth' : 'Feb 4, 2002',
        'fname' : 'Jack',
        'lname' : 'Herberger'
    },
    'JohnDoe' : {
        'date_of_birth' : 'Jan 1, 2000',
        'fname' : 'John',
        'lname' : 'Doe'
    },
    'Olivia47' : {
        'date_of_birth' : 'Dec 25, 1999',
        'fname' : 'Olivia',
        'lname' : 'Laugh'
    }
})

check = db.reference('/users/JackHerberger')
print(ref.get())


