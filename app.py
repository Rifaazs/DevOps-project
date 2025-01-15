from flask import Flask, render_template, request, jsonify
from health_utils import calculate_bmi, calculate_bmr

app = Flask(__name__)


@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy'})

@app.route('/bmi', methods=['POST'])
def bmi():
    try:
        data = request.get_json()
        
        # Vérification des données requises
        if not data or 'height' not in data or 'weight' not in data:
            return jsonify({'error': 'Missing required fields: height and weight'}), 400
        
        height = float(data['height'])
        weight = float(data['weight'])
        
        result = calculate_bmi(height, weight)
        return jsonify({'BMI': result})
        
    except ValueError as e:
        return jsonify({'error': str(e)}), 400
    except Exception as e:
        return jsonify({'error': 'Internal server error'}), 500

@app.route('/bmr', methods=['POST'])
def bmr():
    try:
        data = request.get_json()
        
        # Vérification des données requises
        required_fields = ['height', 'weight', 'age', 'gender']
        missing_fields = [field for field in required_fields if field not in data]
        
        if missing_fields:
            return jsonify({'error': f'Missing required fields: {", ".join(missing_fields)}'}), 400
        
        height = float(data['height'])
        weight = float(data['weight'])
        age = int(data['age'])
        gender = str(data['gender']).lower()
        
        result = calculate_bmr(height, weight, age, gender)
        return jsonify({'BMR': result})
        
    except ValueError as e:
        return jsonify({'error': str(e)}), 400
    except Exception as e:
        return jsonify({'error': 'Internal server error'}), 500

@app.route('/')
def home():
    return render_template('home.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
