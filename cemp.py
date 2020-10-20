from flask import *
from flaskext.mysql import MySQL
from flask_mail import Mail, Message
from random import *
from datetime import *
from flask_htmlmin import HTMLMIN
import time
import os
import string
import requests
from datetime import datetime

app = Flask(__name__,template_folder ='template')
app.config['MINIFY_HTML'] = True

app.secret_key = os.urandom(34)

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'cemp'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
connection = mysql.connect()


#MySQL Query Driver
def mysql_query(sql):
	connection = mysql.connect()
	cursor = connection.cursor()
	if sql.strip().split(' ')[0].lower() == "select" :
		print(sql)
		cursor.execute(sql)
		print(cursor._executed)
		
		columns = [column[0] for column in cursor.description]
		results = []
		for row in cursor.fetchall():
			results.append(dict(zip(columns, row)))
		data = results
		cursor.close()
		connection.close()
		return data
	if sql.strip().split(' ')[0].lower() != "select" :
		cursor.execute(sql)
		print(cursor._executed)
		
		connection.commit()
		cursor.close()
		connection.close()
		return None
# How to use this function
# --> mysql_query("Select * from user_master;")
# --> mysql_query(" select * from user_master where emailid='{}';".format(email))
#################################################################


# Main Page Route
@app.route('/')
def main():
	return render_template('main.html')


#About PAg Route
@app.route('/about')
def about():
	return render_template('about.html')


#register page
@app.route('/register')
def register():
	return render_template("register.html")

# #registeration code
# @app.route('/registerscreen', methods =['POST'])
# def registerscreen():
# 	username = request.form['username']
# 	gender = request.form['gender']
# 	name = request.form['name']
# 	age = request.form['age']
# 	phone = request.form['phone']
# 	aadhaar = request.form['aadhaar'] 
# 	email = request.form['email']
# 	password = request.form['password']
# 	address = request.form['address']
# 	city = request.form['city']
# 	state = request.form['state']
# 	try:
# 		if usertype == 'Manager':
# 			cursor = connection.cursor()
# 			sql = 'insert into manager_details (Name, Age, Gender, Phone, Email, Address, City, State, Adhaar_number) values (%s, %s, %s, %s, %s, %s, %s, %s, %s)'
# 			val = (name,age,gender,phone,email,address,city,state,aadhaar)
# 			cursor.execute(sql,val)
# 	except TypeError as e:
# 		try:
# 			if usertype == 'Candidate':
# 				cursor = connection.cursor()
# 				sql = 'insert into user_details (Name, Age, Gender, Phone, Email, Address, City, State, Adhaar_number) values (%s, %s, %s, %s, %s, %s, %s, %s, %s)'
# 				val = (name,age,gender,phone,email,address,city,state,aadhaar)
# 				cursor.execute(sql,val)
# 		except TypeError as e:
# 				return render_template("error.html", Message ="wrong password")
# 	return render_template('Login.html',title = "Login")



#Manage forms Page
@app.route('/Manageform')
def Manageform():
	return render_template("manageform.html")

#Manage link Page
@app.route('/Managelink')
def Managelink():
	return render_template("managelink.html")



#Manage link Page
#@app.route('/showcomplaint')

#def showcomplaint():
	#return render_template("showcomplaint.html")


#Login Page
@app.route('/login')
def login():
	return render_template("login.html")

# LOGIN CODE
# START
@app.route('/loginscreen', methods =['POST'])
def loginscreen():
	try:
		email = request.form['email']	
		password = request.form['password'] 
		cursor = connection.cursor()
		sql = "select user_type_master.User_type , user_type_master.email, manager_details.name, manager_details.phone, manager_details.address, manager_details.city, manager_details.state from manager_details JOIN user_type_master  on user_type_master.User_type_id=manager_details.user_type_id WHERE user_type_master.email = %s and Password = %s" 
		sqldt=(email,password)
		cursor.execute(sql,sqldt)
		connection.commit()
		account = cursor.fetchone()
		session['user_type'] = account[0]
		print(session['user_type'])
		session['email'] = account[1]
		session['name']=account[2]
		session['phone'] = account[3]
		session['address'] = account[4]
		session['city'] = account[5]
		session['state'] = account[6]
	except TypeError as e:
		try:
			email = request.form['email']	
			password = request.form['password'] 
			cursor = connection.cursor()
			sql = "select user_type_master.User_type, user_type_master.email, user_details.name, user_details.phone, user_details.address, user_details.city, user_details.state from User_details JOIN user_type_master  on user_type_master.User_type_id=user_details.user_type_id WHERE user_type_master.email = %s and Password = %s" 
			sqldt=(email,password)
			cursor.execute(sql,sqldt)
			connection.commit()
			account = cursor.fetchone()
			session['user_type'] = account[0]
			print(session['user_type'])
			session['email'] = account[1]
			session['name'] = account[2]
			session['phone'] = account[3]
			session['address'] = account[4]
			session['city'] = account[5]
			session['state'] = account[6]
		except TypeError as e:
			try:
				email = request.form['email']	
				password = request.form['password'] 
				cursor = connection.cursor()
				sql = "select User_type , email from user_type_master WHERE Email = %s and Password = %s" 
				sqldt=(email,password)
				cursor.execute(sql,sqldt)
				connection.commit()
				account = cursor.fetchone()
				session['user_type'] = account[0]
				print(session['user_type'])
				session['email'] = account[1]
			except TypeError as e:
				return render_template("error.html", Message ="wrong password")
	return render_template('dashboard.html',title = "Dashboard: "+session['user_type'])		
# END


#Logout Code

@app.route('/logout')
def logout():
	# Remove session data, this will log the user out
   session.pop('email', None)
   session.pop('name', None)
   session.pop('user_id', None)
   # Redirect to login page
   return redirect(url_for('login'))

#Logout Code End


#Update detaila 

@app.route('/updatedetailuser')
def updatedetailuser():
	return render_template("updatedetailuser.html")


#UPDATE PASSWORD CODE
@app.route("/updatepasswordscr/",methods=['POST'])
def updatepasswordscr():
	password = request.form['password'] 
	print(password)
	cursor = connection.cursor()
	sql = "UPDATE `user_type_master` SET `Password`=%s WHERE `email`= %s "
	sqldt = (password,email)
	cursor.execute(sql,sqldt)
	connection.commit()
	cursor.close()
	return redirect(url_for('updatedetailuser'))

#END

#Submit complaint
@app.route('/submitcomplaint')
def submitcomplaint():
	return render_template("submitcomplaint.html")
#END



#Show Complaint and  Route
@app.route("/complaint/")
def showcomplaint():
	data = mysql_query("select c.user_id, u.name, c.type, c.description from complaint_details c, user_details u where u.user_id = c.user_id")
	print(data)
	return render_template('showcomplaint.html',data=data)
#END


#Submit feedback
@app.route('/submitfeedback')
def submitfeedback():
	return render_template("submitfeedback.html")
#END

#Show Feeback and route

@app.route("/feedback/")
def showfeedback():
	data = mysql_query("select u.user_id, u.name, f.feedback_msg from user_details u, feedback_details f where u.user_id = f.user_id")
	print(data)
	return render_template('showfeedback.html',data=data)
#END

#view form code
@app.route('/viewform')
def viewform():
	data=mysql_query("select exam_master.exam_name,exam_master.exam_type,exam_master.name_of_organisation,exam_form_details.form_id,exam_form_details.date_of_opening,exam_form_details.date_of_closing,exam_form_details.fees,exam_form_details.eligibility,exam_form_details.date_of_exam,exam_form_details.link,centre_details.city from exam_form_details join exam_master on exam_form_details.exam_id= exam_master.exam_id join centre_details on exam_form_details.centre_id = centre_details.centre_id")
	return render_template('viewform.html',data=data)
#END

#Applied form for user
@app.route("/applied/")
def showapplied():
	data = mysql_query("select applied_id,registration_no,date_of_exam,date_of_filling,time_of_filling,user_details.email from applied_form join user_details on applied_form.user_id=user_details.user_id where user_details.Email='{}'".format(session['email']))
	return render_template('showapplied.html',data=data)

#end



#Admitcard link page rout
@app.route('/Admitcard')
def Admitcard():
	return render_template("admitcardlink.html")

#Forgot Password
@app.route('/forgotpassword')
def forgotpassword():
	return render_template("forgotpassword.html")



app.jinja_env.cache = {}
if __name__ == '__main__':
	app.run(host='0.0.0.0',port='3030',debug = True)

