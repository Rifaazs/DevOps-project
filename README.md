# Health Calculator Microservice with CI/CD Pipeline on Azure

## Project Overview
This project involves the creation of a Python-based microservice that calculates health metrics (BMI and BMR) using a REST API. The application is containerized with Docker, orchestrated using a Makefile, and deployed to Azure App Service using a CI/CD pipeline implemented with GitHub Actions.

---

## Features
- **BMI Calculation**: Calculates Body Mass Index (BMI) using weight (kg) and height (m).
- **BMR Calculation**: Calculates Basal Metabolic Rate (BMR) using weight (kg), height (cm), age, and gender.
- **RESTful API**: Flask-based API with endpoints:
  - `/bmi`: For BMI calculations.
  - `/bmr`: For BMR calculations.
- **Dockerized**: Fully containerized application.
- **CI/CD**: GitHub Actions pipeline for automated testing and deployment.
- **Azure Deployment**: Hosted on Azure App Service.

---

## Prerequisites

### Tools
- [Python 3.9+](https://www.python.org/)
- [Docker](https://www.docker.com/)
- [Git](https://git-scm.com/)
- [Azure Account](https://azure.microsoft.com/)

### Setup Instructions
1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd health-calculator-service
   ```
2. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the Flask app locally:
   ```bash
   python app.py
   ```
4. Test API endpoints using tools like Postman or curl.

---

## Project Structure
```
health-calculator-service/
├── app.py               # Main Flask application
├── health_utils.py      # Utility functions for BMI and BMR calculations
├── requirements.txt     # Python dependencies
├── Dockerfile           # Docker configuration
├── Makefile             # Task automation
├── test.py              # Unit tests
└── .github/workflows/ci-cd.yml  # GitHub Actions pipeline
```

---

## API Endpoints
### 1. `/bmi`
**Method**: POST

**Request Body**:
```json
{
  "height": 1.75,
  "weight": 70
}
```

**Response**:
```json
{
  "bmi": 22.86
}
```

### 2. `/bmr`
**Method**: POST

**Request Body**:
```json
{
  "height": 175,
  "weight": 70,
  "age": 30,
  "gender": "male"
}
```

**Response**:
```json
{
  "bmr": 1666.47
}
```

---

## Docker Usage
### Build Docker Image
```bash
docker build -t health-calculator-service .
```

### Run Docker Container
```bash
docker run -p 5000:5000 health-calculator-service
```

---

## Makefile Commands
| Command       | Description                       |
|---------------|-----------------------------------|
| `make init`   | Install dependencies              |
| `make run`    | Run the Flask application         |
| `make test`   | Execute unit tests                |
| `make build`  | Build the Docker image            |
| `make clean`  | Remove temporary/generated files  |

---

## Testing
Run unit tests to validate BMI and BMR calculations:
```bash
python -m unittest test.py
```

---

## CI/CD Pipeline
### GitHub Actions Workflow
The CI/CD pipeline automates the following tasks:
1. Checks out the code.
2. Sets up the Python environment.
3. Installs dependencies.
4. Runs unit tests.
5. Builds the Docker image.
6. Deploys the application to Azure.

The configuration is in `.github/workflows/ci-cd.yml`.

### Deployment to Azure
1. Create an Azure App Service instance.
2. Download the **Publish Profile** from Azure.
3. Add the profile to GitHub Secrets as `AZURE_WEBAPP_PUBLISH_PROFILE`.
4. Push changes to the `main` branch to trigger deployment.

---

## Known Issues and Improvements
- Additional validations can be added for API inputs.
- Add caching mechanisms for repeated calculations.
- Extend the CI/CD pipeline with additional stages like linting or security scans.

---

## License
This project is licensed under the MIT License. See the LICENSE file for details.

---

## Author
Your Name

For questions or feedback, feel free to contact [your_email@example.com].
