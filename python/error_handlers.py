from flask import render_template

def not_found_error(app):
    @app.errorhandler(404)
    def not_found(e):
        return render_template('error_404.html'), 404
