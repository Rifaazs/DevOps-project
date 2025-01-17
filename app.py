# Importation des modules nécessaires
from flask import Flask, render_template, request, jsonify  # Framework Flask et ses composants
from health_utils import calculate_bmi, calculate_bmr  # Fonctions utilitaires pour les calculs de santé

# Initialisation de l'application Flask
app = Flask(__name__)

# Route pour vérifier l'état de l'application
@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy'})  # Retourne un statut simple pour les vérifications de santé

# Route pour calculer l'IMC (Indice de Masse Corporelle)
@app.route('/bmi', methods=['POST'])
def bmi():
    try:
        data = request.get_json()  # Récupération des données JSON de la requête
        
        # Vérifie si toutes les données nécessaires sont présentes
        if not data or 'height' not in data or 'weight' not in data:
            return jsonify({'error': 'Missing required fields: height and weight'}), 400
        
        # Conversion des données en nombres décimaux
        height = float(data['height'])
        weight = float(data['weight'])
        
        # Calcul de l'IMC et retour du résultat
        result = calculate_bmi(height, weight)
        return jsonify({'BMI': result})
        
    except ValueError as e:
        return jsonify({'error': str(e)}), 400  # Erreur de validation des données
    except Exception as e:
        return jsonify({'error': 'Internal server error'}), 500  # Erreur serveur

# Route pour calculer le BMR (Métabolisme de Base)
@app.route('/bmr', methods=['POST'])
def bmr():
    try:
        data = request.get_json()  # Récupération des données JSON
        
        # Vérification des champs requis
        required_fields = ['height', 'weight', 'age', 'gender']
        missing_fields = [field for field in required_fields if field not in data]
        
        if missing_fields:
            return jsonify({'error': f'Missing required fields: {", ".join(missing_fields)}'}), 400
        
        # Conversion et validation des données
        height = float(data['height'])
        weight = float(data['weight'])
        age = int(data['age'])
        gender = str(data['gender']).lower()
        
        # Calcul du BMR et retour du résultat
        result = calculate_bmr(height, weight, age, gender)
        return jsonify({'BMR': result})
        
    except ValueError as e:
        return jsonify({'error': str(e)}), 400  # Erreur de validation
    except Exception as e:
        return jsonify({'error': 'Internal server error'}), 500  # Erreur serveur

# Route principale qui affiche la page d'accueil
@app.route('/')
def home():
    return render_template('home.html')  # Rendu du template HTML

# Point d'entrée de l'application
if __name__ == '__main__':
    # Démarrage du serveur Flask
    # host='0.0.0.0' permet l'accès depuis n'importe quelle adresse IP
    # port=5000 définit le port d'écoute
    # debug=True active le mode débogage
    app.run(host='0.0.0.0', port=5000, debug=True)
