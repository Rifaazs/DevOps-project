# Variables
IMAGE_NAME = health-calculator
CONTAINER_NAME = health-calculator-app
PORT = 5000

# Commandes de base
.PHONY: init build run status test-api test stop clean help

# Installation des dépendances requises
init:
	@echo "Installing dependencies..."
	pip install -r requirements.txt
	@echo "Dependencies installed successfully!"

# Construire l'image Docker
build:
	@echo "Building Docker image ongoing..."
	docker build -t $(IMAGE_NAME) .
	@echo "Build completed!"

# Lancer le conteneur
run:
	@echo "Starting container!"
	-docker rm -f $(CONTAINER_NAME) 2>/dev/null || true
	docker run -d -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)
	@echo "Container started on port $(PORT)!"
	@echo "Waiting for application to start..."
	@sleep 3

# Voir le statut du conteneur
status:
	@echo "Container status:"
	@docker ps -a | grep $(CONTAINER_NAME) || echo "Container not found"

# Tester l'application avec unittest
test-api:
	@echo "Running unit tests..."
	python -m unittest test_app.py -v
	@echo "Tests completed!"

# Tester les endpoints de l'API
test: 
	@echo "Testing API endpoints..."
	@echo "\nTesting health endpoint..."
	@curl -s http://localhost:$(PORT)/health || echo "Health check failed"
	@echo "\nTesting BMI calculation..."
	@curl -s -X POST http://localhost:$(PORT)/bmi \
		-H "Content-Type: application/json" \
		-d '{"height": 1.75, "weight": 70}' || echo "BMI test failed"
	@echo "\nTesting BMR calculation..."
	@curl -s -X POST http://localhost:$(PORT)/bmr \
		-H "Content-Type: application/json" \
		-d '{"height": 175, "weight": 70, "age": 30, "gender": "male"}' || echo "BMR test failed"
	@echo "\nAPI tests completed!"

# Arrêter le conteneur
stop:
	@echo "Stopping container..."
	-docker stop $(CONTAINER_NAME) 2>/dev/null || true
	-docker rm $(CONTAINER_NAME) 2>/dev/null || true
	@echo "Container stopped and removed"

# Nettoyer (arrêter le conteneur et supprimer l'image)
clean: stop
	@echo "Removing Docker image..."
	-docker rmi $(IMAGE_NAME) 2>/dev/null || true
	@echo "Cleanup complete!"

# Aide
help:
	@echo "Available commands:"
	@echo "make init      - Install Dependencies"
	@echo "make build     - Build Docker image"
	@echo "make run       - Run container"
	@echo "make status    - Show Container Status"
	@echo "make test-api  - Run Unit Tests"
	@echo "make test      - Test API Endpoints"
	@echo "make stop      - Stop and remove container"
	@echo "make clean     - Stop container and clean"
