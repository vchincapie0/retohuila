from flask import Flask, render_template, request, redirect,url_for,flash,session
from flask_mysqldb import MySQL 

app = Flask(__name__)

'''Conexión a bd'''
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='retohuila'
mysql=MySQL(app)

'''Settings'''
app.secret_key='mysecretkey'


@app.route('/')
def index():
    return render_template('index.html')

if __name__=='__main__':
    #Se verifica que se este corriendo la aplicacion.
    app.run(debug=True)

