from flask import Flask, render_template, request, redirect, url_for, session, jsonify
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

@app.route('/', methods=['GET', 'POST'])  # Ahora permite GET también
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
            return render_template('incorrecto.html') # Si las credenciales son incorrectas
    return render_template('login.html')  # Si GET, muestra login


# Ruta para registrar un nuevo usuario
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        name = request.form['nombre']
        mail = request.form['mail']
        rol = "user"

        cursor = mysql.connection.cursor()
        try:
            # Insertar nuevo usuario en la base de datos
            cursor.execute('INSERT INTO usuarios (username, password, rol, email, nombre) VALUES (%s, %s, %s, %s, %s)',
                           (username, password, rol, mail, name))
            mysql.connection.commit()
            return redirect(url_for('login'))
        except MySQLdb.IntegrityError:
            # Usuario duplicado
            return "Usuario ya existe"
    return render_template('register.html')

# Página protegida que muestra el rol actual
@app.route('/dashboard-user')
def dashboardUser():
    if 'rol' not in session:
        # Redirigir al login si no hay sesión iniciada
        return redirect(url_for('login'))
    # Mostrar el rol del usuario logueado
    return render_template('dashboard-user.html', rol=session['rol'])

@app.route('/dashboard-manager')
def dashboardManager():
    if 'rol' not in session:
        # Redirigir al login si no hay sesión iniciada
        return redirect(url_for('login'))
    # Mostrar el rol del usuario logueado
    return render_template('dashboard-manager.html', rol=session['rol'])

@app.route('/dashboard-admin')
def dashboardAdmin():
    if 'rol' not in session:
        # Redirigir al login si no hay sesión iniciada
        return redirect(url_for('login'))
    # Mostrar el rol del usuario logueado
    return render_template('dashboard-admin.html', rol=session['rol'])

@app.route('/zona/<nombre>')
def obtener_zona(nombre):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM zonas WHERE nombre = %s', (nombre,))
    zona = cursor.fetchone()
    if zona:
        return jsonify(zona)
    return jsonify({'error': 'Zona no encontrada'}), 404

# Ruta para cerrar sesión
@app.route('/logout')
def logout():
    session.clear()  # Eliminar todos los datos de la sesión
    return redirect(url_for('login'))

@app.route('/admin/usuarios')
def listar_usuarios():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM usuarios")
    usuarios = cursor.fetchall()
    return render_template('crud_usuarios.html', usuarios=usuarios)

@app.route('/admin/usuarios/editar/<int:id>', methods=['GET', 'POST'])
def editar_usuario(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        nombre = request.form['nombre']
        rol = request.form['rol']
        cursor.execute("UPDATE usuarios SET username=%s, email=%s, nombre=%s, rol=%s WHERE id=%s",
                       (username, email, nombre, rol, id))
        mysql.connection.commit()
        return redirect(url_for('listar_usuarios'))
    cursor.execute("SELECT * FROM usuarios WHERE id = %s", (id,))
    usuario = cursor.fetchone()
    return render_template('editar_usuario.html', usuario=usuario)

@app.route('/admin/usuarios/eliminar/<int:id>')
def eliminar_usuario(id):
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM usuarios WHERE id = %s", (id,))
    mysql.connection.commit()
    return redirect(url_for('listar_usuarios'))

@app.route('/admin/zonas')
def listar_zonas():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM zonas")
    zonas = cursor.fetchall()
    return render_template('crud_zonas.html', zonas=zonas)


@app.route('/admin/zonas/editar/<int:id>', methods=['GET', 'POST'])
def editar_zona(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if request.method == 'POST':
        nombre = request.form['nombre']
        descripcion = request.form['descripcion']
        precio_m2 = request.form['precio_m2']
        poblacion = request.form['poblacion_total']
        municipios = request.form['municipios']
        imagen = request.form['imagen_destacada']
        cursor.execute("""UPDATE zonas SET nombre=%s, descripcion=%s, precio_m2=%s,
                          poblacion_total=%s, municipios=%s, imagen_destacada=%s WHERE id=%s""",
                       (nombre, descripcion, precio_m2, poblacion, municipios, imagen, id))
        mysql.connection.commit()
        return redirect(url_for('listar_zonas'))
    cursor.execute("SELECT * FROM zonas WHERE id = %s", (id,))
    zona = cursor.fetchone()
    return render_template('editar_zona.html', zona=zona)

@app.route('/admin/zonas/eliminar/<int:id>')
def eliminar_zona(id):
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM zonas WHERE id = %s", (id,))
    mysql.connection.commit()
    return redirect(url_for('listar_zonas'))


@app.route('/manager/zonas')
def listar_zonas_manager():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM zonas")
    zonas = cursor.fetchall()
    return render_template('crud_zonas_manager.html', zonas=zonas)


@app.route('/manager/zonas/editar/<int:id>', methods=['GET', 'POST'])
def editar_zona_manager(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if request.method == 'POST':
        nombre = request.form['nombre']
        descripcion = request.form['descripcion']
        precio_m2 = request.form['precio_m2']
        poblacion = request.form['poblacion_total']
        municipios = request.form['municipios']
        imagen = request.form['imagen_destacada']
        cursor.execute("""UPDATE zonas SET nombre=%s, descripcion=%s, precio_m2=%s,
                          poblacion_total=%s, municipios=%s, imagen_destacada=%s WHERE id=%s""",
                       (nombre, descripcion, precio_m2, poblacion, municipios, imagen, id))
        mysql.connection.commit()
        return redirect(url_for('listar_zonas_manager'))
    cursor.execute("SELECT * FROM zonas WHERE id = %s", (id,))
    zona = cursor.fetchone()
    return render_template('editar_zona_manager.html', zona=zona)

@app.route('/manager/zonas/eliminar/<int:id>')
def eliminar_zona_manager(id):
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM zonas WHERE id = %s", (id,))
    mysql.connection.commit()
    return redirect(url_for('listar_zonas_manager'))

# Ejecutar la aplicación, constructor
if __name__ == '__main__':
    app.run(debug=True)