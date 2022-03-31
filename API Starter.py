import flask
#from Back end Starter import (etc...)
from flask import jsonify
from flask import request, make_response


#Put all route ends here and put what they are example below
#######################################

#view specific user check http://127.0.0.1:5000/api/users/id                                      GET    
#add user check http://127.0.0.1:5000/api/users/create                                            POST



#######################################


#setting up an application name
app = flask.Flask(__name__)#sets up application
app.config["DEBUG"] = True #allow to show erroes in browsers


@app.route('/', methods=['GET'])#default path
def home():
    return "<h1>Default home page of the project</h1>"




# all the work is in the backend instead of the API
# we will be sending information to the back end, then the back end will run sql, then give us back
# the information we are looking for
# example below is a endpoint to create a user where the "user"
# aka customer has given us their first and last name so now we give those information to the 
# add_user for it to run the SQL in the backend

@app.route('/api/user/signup', methods=['POST'])
def api_user_create():
    request_data = request.get_json() #requesting json
    fname = request_data['firstname']
    lname = request_data['lastname']
    email = request_data['email']
    code = request_data['code']
    token = request_data['token']
    if email_signup_checker():
        verification_token_maker()
        #send_email_function_here()
        if verification_token_checker(token):
            if code in locals():
                add_user_with_code(fname, lname, email)  #adding first and lastname to the sql query
            else:
                add_user_without_code(fname, lname, email)
    return 'User added request worked'




app.run()
