from enum import unique
import pyodbc
import random
from pyodbc import Error
from sklearn.compose import ColumnTransformer
import smtplib, ssl

conn = pyodbc.connect('Driver={SQL Server};'                    #dan DESKTOP-UV69AE2\SQLEXPRESS
                      'Server=DESKTOP-UV69AE2\SQLEXPRESS;'  #<< put your desktop thing here whenever you open up
                      'Database=CIS3365;'                   # Management it should tell you what the desktop server name is 
                      'Trusted_Connection=yes;')

cursor = conn.cursor()


#########################################
#DAN SECTION DO NOT CODE HERE 
profile_info = ('Firstname:', 'Lastname:', 'Phone number:', 'Birth Date:', 'Unique code:', 'Address_line1:', 'Country:', 'Amount discount have:', 'State:', 'City:', 'Zipcode:', 'Amount discount used:')

def get_customer_info(email):
    new_return = {}
    get_info = f"SELECT Fname, Lname, Phonenum, BD, Unique_code, Address_line1, CountryID, Amount_discount_have, StateShortened_name, City, Zipcode, Amount_discount_used FROM Customer WHERE email = '{email}'"
    try:
        cursor.execute(get_info)
        rows = cursor.fetchall()
    except Error as e:
        print (f"The error {e} has occur")
    for x in range(11):    
        new_return[profile_info[x]] = rows[0][x]
    print(new_return)
    return new_return
    print(rows)
#get_customer_info('yanahdi@gmail.com')




def get_current_codes():
    current_code_list = []
    get_current_codes = 'SELECT Unique_code FROM Customer'
    try:
        cursor.execute(get_current_codes)
    except Error as e:
        print (f"The error {e} has occur")
    for x in cursor:
        current_code_list.append(x[0])
    return current_code_list


def unique_code_maker():
    current_codes = get_current_codes()
    list = 'QWERTYUIOPASDFGHJKLZXCVBNM12345678901234567890'
    x = True
    while x == True:
        code = ""
        for x in range (5):
            code += random.choice(list)
        if code in current_codes:
            unique_code_maker()
        else:
            print(code, 'good')
            x = False
    return code

def code_signup_check(code):
    current_code_list = []
    get_current_codes = 'SELECT Unique_code FROM Customer'
    try:
        cursor.execute(get_current_codes)
    except Error as e:
        print (f"The error {e} has occur")
    for x in cursor:
        current_code_list.append(x[0])
    if code in current_code_list:
        return 'Code exist!'
    else:
        return 'Code does not exist in database'

def add_point(code):
    current_point = ''
    get_current_points = f"SELECT Amount_discount_have FROM Customer WHERE Unique_code = '{code}'"
    try:
        cursor.execute(get_current_points)
        current_point = cursor.fetchall()[0][0]
    except Error as e:
        print (f"The error {e} has occur")
    
    current_point+=1
    update_points = ("UPDATE Customer\n"
                    f"SET Amount_discount_have = {current_point}\n"
                    f"WHERE Unique_code = '{code}'")
    try:
        cursor.execute(update_points)
        conn.commit()
    except Error as e:
        print(f"The error '{e}' occurred")

#print(add_point('A4B8J'))

def email_signup_check(code):
    current_email_list = []
    get_current_emails = 'SELECT email FROM Customer'
    try:
        cursor.execute(get_current_emails)
    except Error as e:
        print (f"The error {e} has occur")
    for x in cursor:
        current_email_list.append(x[0])
    if code in current_email_list:
        return False #'Email already exist! Please try a different one'
    else:
        return True #'Email does not exist in database, Good to go'


#function below creates a new customer with given fname, lname and email
#it will also make a new code for the new customer
#this will only happen if the customer has given us an existing code for registering with another customer
def customer_signup_with_code(fname, lname, email, code):
    new_code = unique_code_maker()
    add_point(code)
    sign_up = ("INSERT INTO Customer\n"
           "([Fname]\n"
           ",[Lname]\n"
           ",[Email]\n"
           ",[Unique_code]\n"
           ",[Amount_discount_have]\n"
           ",[Customer_statusID]\n"
           ",[Promo_signup_statusID])\n"
     "VALUES\n"
           f"('{fname}'\n"
           f",'{lname}'\n"
           f",'{email}'\n"
           f",'{new_code}'\n"
           ",'1'\n"
           ",'1'\n"    
           ",'2')")
    try:
        cursor.execute(sign_up)
        conn.commit()
    except Error as e:
        print(f"The error '{e}' occurred")

    return "Sign up successful"

def customer_signup_no_code(fname, lname, email):
    new_code = unique_code_maker()
    sign_up = ("INSERT INTO Customer\n"
           "([Fname]\n"
           ",[Lname]\n"
           ",[Email]\n"
           ",[Unique_code]\n"
           ",[Amount_discount_have]\n"
           ",[Customer_statusID]\n"
           ",[Promo_signup_statusID])\n"
     "VALUES\n"
           f"('{fname}'\n"
           f",'{lname}'\n"
           f",'{email}'\n"
           f",'{new_code}'\n"
           ",'0'\n"
           ",'1'\n"    
           ",'2')")
    try:
        cursor.execute(sign_up)
        conn.commit()
    except Error as e:
        print(f"The error '{e}' occurred")

    return "Sign up successful"



def verification_token_maker():
    list = 'QWERTYUIOPASDFGHJKLZXCVBNM12345678901234567890'
    token = ""
    for x in range (10):
        token += random.choice(list)
    #insert into token db
    print(token)
    token_sql = ("INSERT INTO Token\n"
           "([Token]\n"
           ",[Time_create]\n"
           ",[Token_statusID])\n"
     "VALUES\n"
           f"('{token}'\n"
           ",(SELECT GETDATE())\n"
           ",'1')")
    try:
        cursor.execute(token_sql)
        conn.commit()
    except Error as e:
        print(f"The error '{e}' occurred")
    return token
    
    
#verification_token_maker()

def verification_token_checker(vtoken):
    current_token_list = []
    get_current_tokens = 'SELECT Token FROM Token'
    try:
        cursor.execute(get_current_tokens)
    except Error as e:
        print (f"The error {e} has occur")
    for token in cursor:
        current_token_list.append(token[0])
    if vtoken in current_token_list:
        mark = ("UPDATE Token\n"
            "SET Token_statusID = '3', Time_expire = (SELECT GETDATE())\n"
            f"WHERE Token = '{vtoken}'")
        try:
            cursor.execute(mark)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")
        return True #'Token is good to go'
    else:
        return False #'Token does not exist'

#print(verification_token_checker('ITX6HJVC5N'))


#######################
#EMAIL

def send_email(receiver_email, code):
    port = 465  # For SSL
    smtp_server = "smtp.gmail.com"
    sender_email = "cutthroatbarberpromotional@gmail.com"  # Enter your address
    receiver_email = f"{receiver_email}"  # Enter receiver address
    password = "CutthroatBarber123"
    message = f"""\
    Subject: Hello New Customer

    Your email confirmation code is {code}
    This message is sent from Python."""

    context = ssl.create_default_context()
    with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, message)
    
    print("email sent")

#send_email("daannn445@gmail.com", "TEST")
###########################

def get_all_tables():
    my_list = []
    get = ("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'")
    try:
        cursor.execute(get)
        rows = cursor.fetchall()
        for item in rows:
            if item[0] == 'sysdiagrams':
                pass
            else:
                my_list.append(item[0])
    except Error as e:
        print (f"The error {e} has occur")
    return my_list

#print(get_all_tables())

def view_table(name):
    final_list = []
    view = f'SELECT * FROM {name}'
    try:
        cursor.execute(view)
        rows = cursor.fetchall()
        columns = [column[0] for column in cursor.description]
    except Error as e:
        print (f"The error {e} has occur")
    for y in range(len(rows)):
        my_dict = {}
        for x in range(len(columns)):
            my_dict[columns[x]] = rows[y][x]
        final_list.append(my_dict)
    return final_list

#(view_table('Incident_list'))



def add_data(table_name, para1, para2, para3, para4, para5, para6, para7, para8, para9, para10, para11, para12, para13, para14, para15, para16, para17):
    if table_name == 'Contact_method':
        add = ("INSERT INTO [Contact_method]\n"
        "([Method])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")
    if table_name == 'Country':
        add = ("INSERT INTO [Country]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")
    if table_name == 'Customer':
        add = ("INSERT INTO [Customer]\n"
           "([Fname]\n"
           ",[Lname]\n"
           ",[Email]\n"
           ",[Phonenum]\n"
           ",[BD]\n"
           ",[Unique_code]\n"
           ",[Address_line1]\n"
           ",[Customer_typeID]\n"
           ",[CountryID]\n"
           ",[Amount_discount_have]\n"
           ",[StateShortened_name]\n"
           ",[City]\n"
           ",[Zipcode]\n"
           ",[Customer_statusID]\n"
           ",[Promo_signup_statusID]\n"
           ",[Amount_discount_used]\n"
           ",[Registration_date])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}'\n"
           f",'{para4}'\n"
           f",'{para5}'\n"
           f",'{para6}'\n"
           f",'{para7}'\n"
           f",'{para8}'\n"
           f",'{para9}'\n"
           f",'{para10}'\n"
           f",'{para11}'\n"
           f",'{para12}'\n"
           f",'{para13}'\n"
           f",'{para14}'\n"
           f",'{para15}'\n"
           f",'{para16}'\n"
           f",'{para17}')\n")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Customer_feedback':
        add = ("INSERT INTO [Customer_feedback]\n"
        "([CustomerID]\n"
           ",[StoreID]\n"
           ",[Feedback]\n"
           ",[Customer_feedback_statusID])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}'\n"
           f",'{para4}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")
        
    if table_name == 'Customer_feedback_status':
        add = ("INSERT INTO [Customer_feedback_status]\n"
        "([Status])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Customer_interaction':
        add = ("INSERT INTO [Customer_interaction]\n"
        "([ServiceID]\n"
           ",[CustomerID]\n"
           ",[Note]\n"
           ",[Customer_interaction_statusID]\n"
           ",[Used_discount])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}'\n"
           f",'{para4}'\n"
           f",'{para5}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Customer_interaction_status':
        add = ("INSERT INTO [Customer_interaction_status]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")
    
    if table_name == 'Customer_note':
        add = ("INSERT INTO [Customer_note]\n"
        "([Note]\n"
           ",[CustomerID])\n"
        "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")
    
    if table_name == 'Customer_social':
        add = ("INSERT INTO [Customer_social]\n"
        "([Social_typeID]\n"
           ",[CustomerID]\n"
           ",[Link])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Customer_social_type':
        add = ("INSERT INTO [Customer_social_type]\n"
        "([Type])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Customer_status':
        add = ("INSERT INTO [Customer_status]\n"
            "([Name]\n"
           ",[Comment])\n"
        "VALUES\n"
            f"('{para1}'\n"
            f",'{para2}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Customer_type':
        add = ("INSERT INTO [Customer_type]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    
    if table_name == 'Employee':
        add = ("INSERT INTO [Employee]\n"
           "([Fname]\n"
           ",[Lname]\n"
           ",[Email]\n"
           ",[Phonenum]\n"
           ",[BD]\n"
           ",[Change_discount]\n"
           ",[Address_line1]\n"
           ",[CountryID]\n"
           ",[Employee_typeID]\n"
           ",[StateShortened_name]\n"
           ",[City]\n"
           ",[Zipcode]\n"
           ",[Employee_statusID])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}'\n"
           f",'{para4}'\n"
           f",'{para5}'\n"
           f",'{para6}'\n"
           f",'{para7}'\n"
           f",'{para8}'\n"
           f",'{para9}'\n"
           f",'{para10}'\n"
           f",'{para11}'\n"
           f",'{para12}'\n"
           f",'{para13}'\n")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Employee_note':
        add = ("INSERT INTO [Employee_note]\n"
            "([EmployeeID]\n"
           ",[Note])\n"
            "VALUES\n"
            f"('{para1}'\n"
            f",'{para2}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Employee_status':
        add = ("INSERT INTO [Employee_status]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Employee_type':
        add = ("INSERT INTO [Employee_type]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Incident_list':
        add = ("INSERT INTO [Incident_list]\n"
        "([Incident_typeID]\n"
           ",[EmployeeID]\n"
           ",[Note]\n"
           ",[Other_employee]\n"
           ",[CustomerID]\n"
           ",[Cost])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}'\n"
           f",'{para4}'\n"
           f",'{para5}'\n"
           f",'{para6}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Incident_type':
        add = ("INSERT INTO [Incident_type]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")


    if table_name == 'Preferred_barber':
        add = ("INSERT INTO [Preferred_barber]\n"
            "([CustomerID]\n"
           ",[EmployeeID])\n"
            "VALUES\n"
            f"('{para1}'\n"
            f",'{para2}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Preferred_method':
        add = ("INSERT INTO [Preferred_method]\n"
            "([Contact_methodID]\n"
           ",[CustomerID])\n"
            "VALUES\n"
            f"('{para1}'\n"
            f",'{para2}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Promo_signup_status':
        add = ("INSERT INTO [Promo_signup_status]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'Service':
        add = ("INSERT INTO [Service]\n"
        "([Description]\n"
           ",[Name]\n"
           ",[Price])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

    if table_name == 'State':
        add = ("INSERT INTO [State]\n"
        "([Shortened_name]\n"
           ",[Fullname]\n"
           ",[CountryID])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")
    
    if table_name == 'Store':
        add = ("INSERT INTO [Store]\n"
           "([Store_name]\n"
           ",[Address_line1]\n"
           ",[CountryID]\n"
           ",[StateShortened_name]\n"
           ",[City]\n"
           ",[Zipcode]\n"
           ",[Phonenum])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}'\n"
           f",'{para4}'\n"
           f",'{para5}'\n"
           f",'{para6}'\n"
           f",'{para7}'\n")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")


    if table_name == 'Token':
        add = ("INSERT INTO [Token]\n"
           "([Token]\n"
           ",[Time_create]\n"
           ",[Time_expire]\n"
           ",[CustomerID]\n"
           ",[Token_statusID])\n"
     "VALUES\n"
           f"('{para1}'\n"
           f",'{para2}'\n"
           f",'{para3}'\n"
           f",'{para4}'\n"
           f",'{para5}'\n")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")


    if table_name == 'Token_status':
        add = ("INSERT INTO [Token_status]\n"
        "([Name])\n"
        "VALUES\n"
        f"('{para1}')")
        try:
            cursor.execute(add)
            conn.commit()
        except Error as e:
            print(f"The error '{e}' occurred")

def update_data(table_name, column_name, ID, new_data):
    update = (f"UPDATE {table_name}\n"
        f"SET [{column_name}] = '{new_data}'\n"
        f"WHERE ID = '{ID}'")
    try:
            cursor.execute(update)
            conn.commit()
    except Error as e:
        print(f"The error '{e}' occurred")

def delete_data(table_name, ID):
    delete = f"DELETE FROM {table_name} WHERE ID = '{ID}'"
    try:
            cursor.execute(delete)
            conn.commit()
    except Error as e:
        print(f"The error '{e}' occurred")
