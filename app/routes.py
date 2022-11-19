from app import app
from app.decorators import is_json, validate_json
from flask import jsonify

@app.route('/')
def home():
    return {'message': 'Hello Flask!'}

@app.route('/service', methods=['POST'])
@is_json
@validate_json
def service():
    return {'success': True}

@app.route('/health', methods=['GET'])
def getHealth():
    print("ok")
    return jsonify(status = "ok", version = "1.0")
