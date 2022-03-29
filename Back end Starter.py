from enum import unique
import pyodbc
import random
from pyodbc import Error

conn = pyodbc.connect('Driver={SQL Server};'
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




def email_message_signup(email):
    #create sample email
    #token_maker()
    #send email to cus email with link w token
    # https://realpython.com/handling-email-confirmation-in-flask/
    pass


def customer_signup(fname, lname, email):
    
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







