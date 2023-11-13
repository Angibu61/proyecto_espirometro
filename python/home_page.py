from flask import render_template

def init_home_page(app):
    @app.route('/', methods=['GET'], endpoint='home')
    def home():
        return render_template('pages_home.html')
