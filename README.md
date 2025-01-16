# Flask App - DevOps Project Template

This repository serves as a template for a simple Flask-based DevOps project. The app provides basic calculator functionalities (addition and subtraction) and includes all necessary files for setting up a local environment, running tests, and deploying to a cloud service with best practices in DevOps.

## Project Structure

The repository is organized as follows:

```plaintext
DEVOPS-PROJECT/
├── app.py
├── utils.py
├── test.py
├── requirements.txt
├── Makefile
├── templates/
│   └── home.html
├── .env
├── .gitignore
```

### File Descriptions

- **`app.py`**: The main application file for the Flask app. It sets up routes and connects them to functions in `utils.py` to provide API endpoints for app operations.

- **`utils.py`**: Contains utility functions for core operations like addition and subtraction. This file is designed to house the main logic for the app’s functionality.

- **`test.py`**: A unit test file that includes tests for the functions defined in `utils.py`. This file ensures that the core functionality behaves as expected.

- **`requirements.txt`**: Lists the Python dependencies needed to run the application. This file is used to install the necessary packages in the project environment.

- **`Makefile`**: A makefile to streamline project setup and operations. Includes commands for:
  - `make init`: Install project dependencies.
  - `make run`: Start the Flask app.
  - `make test`: Run all unit tests.

- **`templates/home.html`**: HTML template for the app's user interface. This file provides input fields and buttons for interacting with the calculator operations.

- **`.env`**: A configuration file for environment variables. It’s used to securely store sensitive information (like API keys, database credentials, or environment-specific settings). **Note**: This file should not be committed to version control for security reasons.

- **`.gitignore`**: Specifies files and directories that should be ignored by Git. It typically includes files such as `.env` and compiled Python files (`__pycache__`), as well as local environment and dependency caches.

## Getting Started

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd DEVOPS-PROJECT
   ```

2. **Set Up the Environment**:
   - Create and activate a virtual environment (recommended for managing dependencies).
   - Install the dependencies:
     ```bash
     make init
     ```

3. **Run the Application**:
   - Start the Flask app locally:
     ```bash
     make run
     ```


4. **Run Tests**:
   - Execute unit tests to verify functionality:
     ```bash
     make test
     ```

## Additional Configuration

- **Environment Variables**:
  - Use the `.env` file to store any environment-specific configurations or sensitive information. Be sure to keep this file out of version control by listing it in `.gitignore`.

## Deployment Instructions

For deployment, configure CI/CD pipelines according to your preferred platform (e.g., GitHub Actions, Azure Pipelines). This template can be used with cloud deployment platforms like AWS, Azure, or Heroku for easy scalability.
  - Use `pipeline.yaml` as a template for a pipeline to build and deploy an application on Azure

## Author

This template was created by **Ali Mokh** and is intended as an educational resource for DevOps projects involving Flask applications.

## License and Usage

This project template is open to use by anyone and may be freely adapted for personal or professional projects. If you use this template as part of teaching materials or educational content, please cite **Ali Mokh** as the original author.


# Health Calculator Microservice

Un microservice REST API développé en Python pour calculer des métriques de santé (IMC et BMR) avec Docker et des tests automatisés.

## 🚀 Fonctionnalités

- Calcul de l'IMC (Indice de Masse Corporelle)
- Calcul du BMR (Basal Metabolic Rate) avec l'équation Harris-Benedict
- API REST avec Flask
- Conteneurisation avec Docker
- Tests automatisés
- Makefile pour l'automatisation des tâches

## 📋 Prérequis

- Python 3.9+
- Docker
- Make
- curl (pour les tests API)

## 🛠 Installation

1. Cloner le repository :
```bash
git clone https://github.com/votre-username/health-calculator-service.git
cd health-calculator-service
```

2. Initialiser l'environnement :
```bash
make init
```

## 🏗 Construction et Démarrage

1. Construire l'image Docker :
```bash
make build
```

2. Lancer le conteneur :
```bash
make run
```

3. Vérifier le statut :
```bash
make status
```

## 🧪 Tests

1. Exécuter les tests unitaires :
```bash
make test-api
```

2. Tester les endpoints de l'API :
```bash
make test
```

## 📌 Endpoints API

### Calcul de l'IMC
```http
POST /bmi
```
Body:
```json
{
    "height": 1.75,    // en mètres
    "weight": 70       // en kilogrammes
}
```

### Calcul du BMR
```http
POST /bmr
```
Body:
```json
{
    "height": 175,     // en centimètres
    "weight": 70,      // en kilogrammes
    "age": 30,         // en années
    "gender": "male"   // "male" ou "female"
}
```

### Vérification de la santé
```http
GET /health
```

## 🧮 Formules Utilisées

### IMC
```
IMC = poids(kg) / (taille(m))²
```

### BMR (Harris-Benedict)
Pour les hommes :
```
BMR = 88.362 + (13.397 × poids(kg)) + (4.799 × taille(cm)) - (5.677 × âge)
```
Pour les femmes :
```
BMR = 447.593 + (9.247 × poids(kg)) + (3.098 × taille(cm)) - (4.330 × âge)
```

## 📝 Commandes Make Disponibles

- `make init` : Initialise l'environnement virtuel et installe les dépendances
- `make build` : Construit l'image Docker
- `make run` : Lance le conteneur
- `make status` : Affiche le statut du conteneur
- `make test-api` : Lance les tests unitaires
- `make test` : Teste les endpoints de l'API
- `make stop` : Arrête et supprime le conteneur
- `make clean` : Nettoie tout (conteneur, image, et environnement virtuel)

## 🛑 Arrêt et Nettoyage

Pour arrêter le conteneur :
```bash
make stop
```

Pour tout nettoyer :
```bash
make clean
```

## 🔍 Structure du Projet

```
health-calculator-service/
│
├── app.py              # Application Flask principale
├── health_utils.py     # Fonctions utilitaires pour les calculs
├── test.py            # Tests unitaires
├── Dockerfile         # Configuration Docker
├── Makefile          # Automatisation des tâches
└── requirements.txt   # Dépendances Python
```

## ⚙️ Variables d'Environnement

Le service utilise les variables d'environnement suivantes :
- `PORT` : Port sur lequel le service écoute (défaut: 5000)

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commit vos changements
4. Push sur la branche
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.
