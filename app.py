from flask import Flask, request, jsonify
from utils import calculate_bmi, calculate_bmr

app = Flask(__name__)

@app.route('/bmi', methods=['POST'])
def bmi():
    data = request.get_json()
    height = data['height']
    weight = data['weight']
    result = calculate_bmi(height, weight)
    return jsonify({'BMI': result})

@app.route('/bmr', methods=['POST'])
def bmr():
    data = request.get_json()
    height = data['height']
    weight = data['weight']
    age = data['age']
    gender = data['gender']
    result = calculate_bmr(height, weight, age, gender)
    return jsonify({'BMR': result})

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000)
