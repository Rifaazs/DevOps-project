# Définition des variables globales
IMAGE_NAME = health-calculator          # Nom de l'image Docker
CONTAINER_NAME = health-calculator-app  # Nom du conteneur Docker
PORT = 5000                             # Port sur lequel l'application sera exposée
VENV_NAME = .venv                       # Nom de l'environnement virtuel Python
PYTHON = python3                        # Version de Python à utiliser
VENV_DIR = $(VENV_NAME)                 # Chemin vers l'environnement virtuel

# Déclaration des tâches qui ne correspondent pas à des fichiers
.PHONY: init install build run status test-api test stop clean help

# Initialisation de l'environnement virtuel Python
init:
    @echo "Création de l'environnement virtuel..."
    $(PYTHON) -m venv $(VENV_DIR)

# Installation des dépendances Python dans l'environnement virtuel
install:
    @echo "Installing dependencies..."
    . .venv/bin/activate && pip install -r requirements.txt
    @echo "Dépendances installées avec succès !"

# Construction de l'image Docker à partir du Dockerfile
build:
    @echo "Construction de l'image Docker en cours..."
    docker build -t $(IMAGE_NAME) .
    @echo "Construction terminée !"

# Lancement du conteneur Docker
run:
    @echo "Démarrage du conteneur..."
    -docker rm -f $(CONTAINER_NAME) 2>/dev/null || true  # Supprime le conteneur s'il existe déjà
    docker run -d -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)
    @echo "Conteneur démarré sur le port $(PORT) !"
    @echo "En attente du démarrage de l'application..."
    @sleep 3  # Pause pour laisser le temps à l'application de démarrer

# Affichage du statut du conteneur
status:
    @echo "Statut du conteneur :"
    @docker ps -a | grep $(CONTAINER_NAME) || echo "Conteneur non trouvé"

# Exécution des tests unitaires Python
test:
    @echo "Exécution des tests unitaires..."
    $(VENV_DIR)/bin/python -m unittest test_app.py -v
    @echo "Tests terminés !"

# Tests des endpoints de l'API via curl
test-api:
    @echo "Tests des endpoints de l'API..."
    # Test de l'endpoint de santé
    @curl -s http://localhost:$(PORT)/health
    # Test du calcul de l'IMC (Body Mass Index)
    @curl -s -X POST http://localhost:$(PORT)/bmi \
        -H "Content-Type: application/json" \
        -d '{"height": 1.75, "weight": 70}'
    # Test du calcul du BMR (Basal Metabolic Rate)
    @curl -s -X POST http://localhost:$(PORT)/bmr \
        -H "Content-Type: application/json" \
        -d '{"height": 175, "weight": 70, "age": 30, "gender": "male"}'

# Arrêt et suppression du conteneur
stop:
    @echo "Arrêt du conteneur..."
    -docker stop $(CONTAINER_NAME) 2>/dev/null || true
    -docker rm $(CONTAINER_NAME) 2>/dev/null || true
    @echo "Conteneur arrêté et supprimé"

# Nettoyage complet : arrêt du conteneur et suppression de l'image
clean: stop  # Dépend de la tâche stop
    @echo "Suppression de l'image Docker..."
    -docker rmi $(IMAGE_NAME) 2>/dev/null || true
    @echo "Nettoyage terminé !"

# Affichage de l'aide avec la liste des commandes disponibles
help:
    @echo "Commandes disponibles :"
    @echo "make init      - Création de l'environnement virtuel"
    @echo "make install   - Installation des dépendances"
    @echo "make build     - Construire l'image Docker"
    @echo "make run       - Démarrer le conteneur"
    @echo "make status    - Afficher le statut du conteneur"
    @echo "make test-api  - Exécuter les tests unitaires"
    @echo "make test      - Tester les endpoints de l'API"
    @echo "make stop      - Arrêter et supprimer le conteneur"
    @echo "make clean     - Arrêter le conteneur et nettoyer"
