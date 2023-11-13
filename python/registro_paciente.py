from flask import request, render_template, redirect, url_for, flash
from .database import get_db_connection
from mysql.connector import Error

def init_registro_paciente(app):
    @app.route('/registro_paciente', methods=['GET', 'POST'])
    def registro_paciente():
        if request.method == 'POST':
            nombre = request.form['nombre']
            nit = request.form['nit']
            edad = request.form['edad']
            sexo = request.form['sexo']
            altura = request.form['altura']

            connection = get_db_connection()
            if connection is not None:
                try:
                    cursor = connection.cursor()
                    insert_query = """
                        INSERT INTO Paciente (Nombre, NIT, Edad, Sexo, Altura)
                        VALUES (%s, %s, %s, %s, %s);
                    """
                    cursor.execute(insert_query, (nombre, nit, edad, sexo, altura))
                    connection.commit()
                    flash('Paciente registrado con éxito.', 'success') 
                except Error as e:
                    flash(f'Error al insertar los datos: {e}', 'error')  
                finally:
                    cursor.close()
                    connection.close()
                return redirect(url_for('registro_paciente'))  
        return render_template('pages_paciente.html')
