from flask import Flask, render_template, request, redirect,url_for,flash,session
from flask_mysqldb import MySQL 

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')

if __name__=='__main__':
    #Se verifica que se este corriendo la aplicacion.
    app.run(debug=True)

