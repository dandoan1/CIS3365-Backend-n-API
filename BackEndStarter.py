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

def employee_view():
    employee_view = 'SELECT * FROM Employee'

    try:
        cursor.execute(employee_view)
    except Error as e:
        print (f"The error {e} has occur")
    return cursor





def customer_view():
    customer_view = 'SELECT * FROM Customer'

    try:
        cursor.execute(customer_view)
    except Error as e:
        print (f"The error {e} has occur")
    return cursor

def get_customer_info(email):
    get_info = f"SELECT * FROM Customer WHERE email = '{email}'"
    try:
        cursor.execute(get_info)
        rows = cursor.fetchall()
    except Error as e:
        print (f"The error {e} has occur")
    return rows

#print(get_customer_info('yanahdi@gmail.com'))



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

send_email("daannn445@gmail.com", "TEST")


###########################






def email_message_signup(email):
    #create sample email
    #token_maker()
    #send email to cus email with link w token
    # https://realpython.com/handling-email-confirmation-in-flask/
    pass







#cursor.execute('SELECT * FROM Customer')
#conn.commit()
#for i in cursor:
#    print(i)


# END OF DAN SECTION CONTINUE BELOW 
###################################################

######################
#Isaiah's Section#


















##########################
# End of Isaiah's Section # 







