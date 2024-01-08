# app.py
from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def hello():
    user_name = request.args.get('name', 'Guest')
    return f'Hello, {user_name}!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

