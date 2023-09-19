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

@app.route('/clientes', methods=('GET','POST'))
def clientes():
    if request.method == 'POST':
        cedula = request.form['cedula']
        nombre = request.form['nombre']
        telefono = request.form['telefono']

        cur=mysql.connection.cursor()
        cur.execute('INSERT INTO tbl_clientes(cedulaCliente,nombre,telefono) VALUES(%s,%s,%s)',(cedula,nombre,telefono))
        mysql.connection.commit()
        flash ('Cliente Registrado')
        return redirect(url_for('index'))

    return render_template('clientes.html')

@app.route('/cuentas' , methods=('GET','POST'))
def cuentas():
    
    if request.method == 'POST':
        
        titular = request.form['titular']
        saldo = request.form['saldo']
        fechaapertura = request.form['fechaapertura']
        estado = request.form['estado']

        cur=mysql.connection.cursor()
        cur.execute('INSERT INTO tbl_cuentas(numeroCuenta,titular,saldo,fechaApertura,estado) VALUES(%s,%s,%s,%s,%s)',(cuenta,titular,saldo,fechaapertura,estado))
        mysql.connection.commit()
        flash ('Cuenta Registrado')
        return redirect(url_for('index'))
    return render_template('cuentas.html')

if __name__=='__main__':
    #Se verifica que se este corriendo la aplicacion.
    app.run(debug=True)

