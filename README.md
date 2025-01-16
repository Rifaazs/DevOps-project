# Health Calculator Pro App - Devops Project

Un microservice REST API développé en Python pour calculer des métriques de santé (IMC et BMR) avec Docker et des tests automatisés.

## 🚀 Fonctionnalités

- Calcul de l'IMC (Indice de Masse Corporelle)
- Calcul du BMR (Basal Metabolic Rate) avec l'équation Harris-Benedict
- API REST avec Flask
- Conteneurisation avec Docker
- Tests automatisés
- Makefile pour l'automatisation des tâches
- Déploiement sur Azure

## 📋 Prérequis

- Python 3.9+
- Docker
- Make
- curl (pour les tests API)
- Azure App Services

## 🛠 Installation

1. Cloner le repository :
```bash
git clone https://github.com/votre-username/health-calculator-service.git
cd health-calculator-service
```

2. Initialiser l'environnement virtuelle :
```bash
make init
```

2. Activer l'environnement virtuelle :
```bash
make install
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

3. Vérifier le statut du conteneur :
```bash
make status
```

## 🧪 Tests

1. Exécuter les tests unitaires :
```bash
make test
```

2. Tester les endpoints de l'API :
```bash
make test-api
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
