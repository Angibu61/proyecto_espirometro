from flask import Flask
import os
from python.error_handlers import not_found_error
from python.registro_paciente import init_registro_paciente
from python.home_page import init_home_page  

# Rutas absolutas para las carpetas 'static' y 'templates'
static_dir = os.path.abspath('static')
template_dir = os.path.abspath('templates')

# Crea la aplicación Flask
app = Flask(__name__, template_folder=template_dir, static_folder=static_dir)
app.secret_key = b"\xe4\xb1'B\x82~r\xab\x15\x0c5g\xad\xc1\x8c\xdd"

# Inicializa la ruta de la página de inicio
init_home_page(app) 

# Inicializa las rutas y funcionalidades relacionadas con 'registro_paciente'
init_registro_paciente(app)

# Manejador de errores (404)
not_found_error(app)

if __name__ == '__main__':
    app.run(debug=True)
