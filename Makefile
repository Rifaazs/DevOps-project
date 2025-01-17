IMAGE_NAME = health-calculator
CONTAINER_NAME = health-calculator-app
PORT = 5000
VENV_NAME = .venv
PYTHON = python3
VENV_DIR = $(VENV_NAME)

# Commandes de base
.PHONY: init install build run status test-api test stop clean help

# Création l'environnement virtuel
init:
	@echo "Création de l'environnement virtuel..."
	$(PYTHON) -m venv $(VENV_DIR)

install:
	@echo "Installing dependencies..."
	. .venv/bin/activate && pip install -r requirements.txt
	@echo "Dépendances installées avec succès !"

# Construire l'image Docker
build:
	@echo "Construction de l'image Docker en cours..."
	docker build -t $(IMAGE_NAME) .
	@echo "Construction terminée !"

# Lancer le conteneur
run:
	@echo "Démarrage du conteneur..."
	-docker rm -f $(CONTAINER_NAME) 2>/dev/null || true
	docker run -d -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)
	@echo "Conteneur démarré sur le port $(PORT) !"
	@echo "En attente du démarrage de l'application..."
	@sleep 3

# Voir le statut du conteneur
status:
	@echo "Statut du conteneur :"
	@docker ps -a | grep $(CONTAINER_NAME) || echo "Conteneur non trouvé"

# Tester l'application avec unittest
test:
	@echo "Exécution des tests unitaires..."
	$(VENV_DIR)/bin/python -m unittest test_app.py -v
	@echo "Tests terminés !"

# Tester les endpoints de l'API
test-api:
	@echo "Tests des endpoints de l'API..."
	@echo "\nTest du endpoint health..."
	@curl -s http://localhost:$(PORT)/health || echo "Échec du test health"
	@echo "\nTest du calcul du BMI..."
	@curl -s -X POST http://localhost:$(PORT)/bmi \
		-H "Content-Type: application/json" \
		-d '{"height": 1.75, "weight": 70}' || echo "Échec du test BMI"
	@echo "\nTest du calcul du BMR..."
	@curl -s -X POST http://localhost:$(PORT)/bmr \
		-H "Content-Type: application/json" \
		-d '{"height": 175, "weight": 70, "age": 30, "gender": "male"}' || echo "Échec du test BMR"
	@echo "\nTests de l'API terminés !"

# Arrêter le conteneur
stop:
	@echo "Arrêt du conteneur..."
	-docker stop $(CONTAINER_NAME) 2>/dev/null || true
	-docker rm $(CONTAINER_NAME) 2>/dev/null || true
	@echo "Conteneur arrêté et supprimé"

# Nettoyer (arrêter le conteneur et supprimer l'image)
clean: stop
	@echo "Suppression de l'image Docker..."
	-docker rmi $(IMAGE_NAME) 2>/dev/null || true
	@echo "Nettoyage terminé !"

# Aide
help:
	@echo "Commandes disponibles :"
	@echo "make init      - Création de l'environnement virtuel"
	@echo "make install"  - Installation des dépendances"
	@echo "make build     - Construire l'image Docker"
	@echo "make run       - Démarrer le conteneur"
	@echo "make status    - Afficher le statut du conteneur"
	@echo "make test-api  - Exécuter les tests unitaires"
	@echo "make test      - Tester les endpoints de l'API"
	@echo "make stop      - Arrêter et supprimer le conteneur"
	@echo "make clean     - Arrêter le conteneur et nettoyer"
