from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors

# instanciamos flask como app
app = Flask(__name__)

# Clave secreta necesaria para manejar sesiones de usuario
app.secret_key = 'clave_secreta'

# Configuración MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'inmo'

# Inicializar la extensión MySQL para Flask
mysql = MySQL(app)

@app.route('/')
def home():
    return render_template('home.html')  # Página principal con botones

@app.route('/login', methods=['GET', 'POST'])  # Ahora permite GET también
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM usuarios WHERE username = %s AND password = %s', (username, password))
        account = cursor.fetchone()

        if account:
            session['username'] = account['username']
            session['rol'] = account['rol']

            if session['rol'] == 'user':
                return redirect(url_for('dashboardUser'))
            elif session['rol'] == 'manager':
                return redirect(url_for('dashboardManager'))
            elif session['rol'] == 'admin':
                return redirect(url_for('dashboardAdmin'))


        else:
            return "Credenciales incorrectas"
    return render_template('login.html')  # Si GET, muestra login


# Ruta para registrar un nuevo usuario
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        rol = "user"

        cursor = mysql.connection.cursor()
        try:
            # Insertar nuevo usuario en la base de datos
            cursor.execute('INSERT INTO usuarios (username, password, rol) VALUES (%s, %s, %s)',
                           (username, password, rol))
            mysql.connection.commit()
            return redirect(url_for('home'))
        except MySQLdb.IntegrityError:
            # Usuario duplicado
            return "Usuario ya existe"
    return render_template('register.html')

# Página protegida que muestra el rol actual
@app.route('/dashboard-user')
def dashboardUser():
    if 'rol' not in session:
        # Redirigir al login si no hay sesión iniciada
        return redirect(url_for('home'))
    # Mostrar el rol del usuario logueado
    return render_template('dashboard-user.html', rol=session['rol'])

@app.route('/dashboard-manager')
def dashboardManager():
    if 'rol' not in session:
        # Redirigir al login si no hay sesión iniciada
        return redirect(url_for('home'))
    # Mostrar el rol del usuario logueado
    return render_template('dashboard-manager.html', rol=session['rol'])

@app.route('/dashboard-admin')
def dashboardAdmin():
    if 'rol' not in session:
        # Redirigir al login si no hay sesión iniciada
        return redirect(url_for('home'))
    # Mostrar el rol del usuario logueado
    return render_template('dashboard-admin.html', rol=session['rol'])

# Ruta para cerrar sesión
@app.route('/logout')
def logout():
    session.clear()  # Eliminar todos los datos de la sesión
    return redirect(url_for('home'))

# Ejecutar la aplicación
if __name__ == '__main__':
    app.run(debug=True)