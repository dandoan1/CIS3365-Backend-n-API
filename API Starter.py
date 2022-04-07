import flask
#from Back end Starter import (etc...)
from flask import jsonify
from flask import request, make_response
from BackEndStarter import (email_signup_check, verification_token_checker, verification_token_maker, delete_data, get_interaction, add_interaction, redeem_discount,
customer_signup_no_code, customer_signup_with_code, send_email, get_customer_info, get_all_tables, view_table, add_data, update_data, check_have_discount)


#Put all route ends here and put what they are example below
#######################################

#view specific user check http://127.0.0.1:5000/api/users/id                                      GET    
#add user check http://127.0.0.1:5000/api/user/signup                                            POST



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
    if email_signup_check(email):
        if token == "":
            created_token = verification_token_maker()
            send_email(email, created_token)
            print('token created', created_token)
        print('email check passed, sent email with token')
        if verification_token_checker(token):
            print('token check passed')
            if code == "":
                customer_signup_no_code(fname, lname, email)
                print('code check passed and created account')
                return 'account has been created successfully'
            else:
                customer_signup_with_code(fname, lname, email, code)  #adding first and lastname to the sql query
                print('code check passed and created account')
                return 'account has been created successfully'
        else:
            print('token check failed')
            return 'try entering your token again'
    else:
        return 'email existed'

"""
{
    "firstname": "Dan",
    "lastname": "ApiTesttoken",
    "email": "thisthingsuck@gmail.com",
    "code": "",
    "token": "047R7U9SNF"
}
"""



@app.route('/api/user/profile/<email>', methods=['GET'])
def api_customer_info(email):
    info = get_customer_info(email)
    return jsonify(info)

#http://127.0.0.1:5000/api/user/profile/<email> for customer to view their information



@app.route('/api/user/admin/table/get', methods=['GET'])
def api_user_admin_get_table():
    info = get_all_tables()
    return jsonify(info)

#go to link to get all tables name


@app.route('/api/user/admin/table/view/<name>', methods=['GET'])
def api_user_admin_view_table(name):
    info = view_table(name)
    results = []
    for infos in info:
        results.append(infos)
    return jsonify(results)

#enter specific table name to view all data inside such table

@app.route('/api/user/admin/table/add', methods=['POST'])
def api_user_admin_add_data():
    request_data = request.get_json() #requesting json
    table_name = request_data['table_name']
    para1 = request_data['para1']
    para2 = request_data['para2']
    para3 = request_data['para3']
    para4 = request_data['para4']
    para5 = request_data['para5']
    para6 = request_data['para6']
    para7 = request_data['para7']
    para8 = request_data['para8']
    para9 = request_data['para9']
    para10 = request_data['para10']
    para11 = request_data['para11']
    para12 = request_data['para12']
    para13 = request_data['para13']
    para14 = request_data['para14']
    para15 = request_data['para15']
    para16 = request_data['para16']
    para17 = request_data['para17']
    add_data(table_name, para1, para2, para3, para4, para5, para6, para7, para8, para9, para10, para11, para12, para13, para14, para15, para16, para17)
    return 'add data successful'


# for customer
"""
{
    "table_name": "customer",
    "para1": "fname", 
    "para2": "lname",
    "para3": "email",
    "para4": "phonenum",
    "para5": "bd",
    "para6": "uniquecode",
    "para7": "address",
    "para8": "cus type id", #default 1 new
    "para9": "country id", #default 185 usa
    "para10": "discount have", #default 0
    "para11": "stateid", #default 95
    "para12": "city",
    "para13": "zip",
    "para14": "cus statuss", #default 1 active
    "para15": "promo status", #default 2 no
    "para16": "discount used", #default 0 none
    "para17": "registration date" #default todays date
}
"""

#any other ones
"""
{
    "table_name": "Contact_method",
    "para1": "Mailing", 
    "para2": "",
    "para3": "",
    "para4": "",
    "para5": "",
    "para6": "",
    "para7": "",
    "para8": "",
    "para9": "",
    "para10": "",
    "para11": "",
    "para12": "",
    "para13": "",
    "para14": "",
    "para15": "",
    "para16": "",
    "para17": ""
}
"""



@app.route('/api/user/admin/table/update', methods=['POST'])
def api_user_admin_update_data():
    request_data = request.get_json() #requesting json
    table_name = request_data['table_name']
    column_name = request_data['column_name']
    ID = request_data['ID']
    new_data = request_data['new_data']
    update_data(table_name, column_name, ID, new_data)
    return 'update data successful'


"""
{
    "table_name": "",
    "column_name": "", 
    "ID": "",
    "new_data": ""
}
"""


@app.route('/api/user/admin/table/delete', methods=['POST'])
def api_user_admin_delete_data():
    request_data = request.get_json() #requesting json
    table_name = request_data['table_name']
    ID = request_data['ID']
    delete_data(table_name,  ID)
    return 'delete data successful'


"""
{
    "table_name": "",
    "ID": ""
}
"""


@app.route('/api/user/admin/interaction/get/<email>', methods=['GET'])
def api_user_admin_interaction_get(email):
    info = get_interaction(email)
    return jsonify(info)

#http://127.0.0.1:5000/api/user/admin/interaction/get/<email> for employee to view all recent interaction by the customer


@app.route('/api/user/admin/interaction/add', methods=['POST'])
def api_user_admin_interaction_add():
    request_data = request.get_json() #requesting json
    email = request_data['email']
    serviceid = request_data['serviceid']
    note = request_data['note']
    storeid = request_data['storeid']
    add_interaction(email, serviceid, note, storeid)
    return 'add interaction successful'

"""
{
    "email": "",
    "serviceid": "", 
    "note": "",
    "storeid": ""
}
"""



@app.route('/api/user/admin/interaction/redeem', methods=['POST'])
def api_user_admin_interaction_redeem():
    request_data = request.get_json() #requesting json
    email = request_data['email']
    interaction_id = request_data['interaction_id']
    if check_have_discount(email):
        redeem_discount(email, interaction_id)
        return 'redeem successful for the interaction'
    else:
        return 'user does not have any discount to redeem'

"""
{
    "email": "",
    "interaction_id": ""
}
"""



app.run()
