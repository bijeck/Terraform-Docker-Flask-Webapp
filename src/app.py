from re import template
from flask import Flask, render_template

app = Flask(__name__,template_folder='templates', static_folder='static_files')

@app.route('/')
def run_tindog_app():
    return render_template('index.html')


app.run()