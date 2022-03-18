from flask import Flask, Response, redirect, url_for, request, session, abort, render_template
from flask_login import LoginManager, UserMixin, login_required, login_user, logout_user, current_user
import database
import base64
import os
get = os.environ['SECRET_KEY']
os.system('python3 keep_alive.py')

app = Flask(__name__) # init app


app.config.update(
    DEBUG = False,
    SECRET_KEY = get
)


login_manager = LoginManager() # init login manager
login_manager.init_app(app)
login_manager.login_view = "login"



class User(UserMixin):  # user class
	def __init__(self, id):
		self.id = id



@app.route('/')
@login_required #forces login
def home():
	userid = current_user.id
	return render_template('index.html', user=userid)


@app.route("/login", methods=["GET", "POST"])
def login():
	if request.method == 'POST':
		username = request.form['username']
		password = request.form['password']
		try:
			if database.users[username] == password:
				user = User(username)
				login_user(user)
				return redirect('/')
			else:
				return redirect('/login')
		except Exception as e:
			print(username), print(password)
			return render_template('error.html') 
	else:
			return render_template('login.html')

@app.route("/admin")
@login_required
def admin():
	return render_template('admin.html')
#index start
@app.route("/logout")
@login_required
def logout():
	logout_user()
	return render_template('logout.html')
@app.route("/pr*xy")
@login_required
def proxy():
	return render_template('proxy.html')
@app.route("/games")
@login_required
def games():
	return render_template('games.html')
#index_end
#p
@app.route("/p1")
@login_required
def p1():
  return render_template('p1.html')
@app.route("/p2")
@login_required
def p2():
	return render_template('p2.html')
@app.route("/p3")
@login_required
def p3():
	return render_template('p3.html')
@app.route("/p4")
@login_required
def p4():
	return render_template('p4.html')
@app.route("/p5")
@login_required
def p5():
  return render_template('p5.html')
#g_start
@app.route("/g1")
@login_required
def g1():
	return render_template('g1.html')
#fnf_start
@app.route("/fnflobby")
@login_required
def fnf():
	return render_template('fnf.html')
#fnf_end
@app.route("/g3")
@login_required
def g3():
	return render_template('g3.html')
@app.route("/g4")
@login_required
def g4():
	return render_template('g4.html')
@app.route("/g5")
@login_required
def g5():
	return render_template('g5.html')
@app.route("/g6")
@login_required
def g6():
	return render_template('g6.html')
@app.route("/g7")
@login_required
def g7():
	return render_template('g7.html')
#g_end
         
@login_manager.user_loader
def load_user(userid):
	return User(userid)
    

if __name__ == '__main__':	
	app.run('0.0.0.0', port=80)

