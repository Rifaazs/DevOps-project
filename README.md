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
- Python 3.9+
- [Docker](https://www.docker.com/)
- Git
- [Azure Account](https://azure.microsoft.com/)

---

## Setup Instructions
1. Clone the repository :
```bash
git clone <repository>
cd health-calculator-service
```

2. Initialise the virtual environment :
```bash
make init
```

3. Activate the virtual environment:
```bash
make install
```

## Building and starting up

1. Build the Docker image :
```bash
make build
```

2. Launch the container:
```bash
make run
```

3. Check the status of the container:
```bash
make status
```

## Tests

1. Run the unit tests :
```bash
make test
```

2. Test the API endpoints:
```bash
make test-api
```
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

## Makefile Commands
| Command         | Description                       |
|-----------------|-----------------------------------|
| `make init`     | Initiate virtual environnement    |
| `make install`  | Activate virtual environnement    |
| `make build`    | Build the docker image            |
| `make run`      | Launch the container              |
| `make status`   | Check the container status        |
| `make test`     | Execute unit tests                |
| `make test-api` | Execute the application           |
| `make stop `    | Stop the container                |
| `make clean`    | Remove temporary/generated files  |


---
## Azure Deployment 

### Step 1: Connect to Your Web App Service
1. Go to the [Azure portal](https://portal.azure.com).
2. Search for and select **App Services** in the search bar.
3. Click on your Web App Service (e.g., `health-calculator-app`).

### 1. Create an Azure Web App
1. Log in to the [Azure Portal](https://portal.azure.com).
2. Navigate to **Create a Resource** → **Web App**.
3. Configure the following:
   - **App Name**: This will be your URL (`{name}.azurewebsites.net`).
   - **Runtime Stack**: Choose your runtime (Node.js, Python, .NET, etc.).
   - **Operating System**: Select either Windows or Linux.
   - **Service Plan**: Pick a suitable pricing tier (Free, Standard, Premium).

### 2. Connect GitHub to Azure
1. Open the Azure Web App in the Azure Portal.
2. Go to **Deployment Center**.
3. Select **GitHub** as the deployment source.
4. Authorize Azure to access your GitHub account.
5. Choose the organization, repository, and branch (e.g., `main`).

---

### 3. Save and Deploy
1. Click **Save** to save your settings.
2. Deployment will start automatically if you have recent commits in your main branch.

## Configuring GitHub Actions Workflow

The following file will add automaticaly to your repository as `.github/workflows/{app-name}.yml`.

The CI/CD pipeline automates the following tasks:
1. Checks out the code.
2. Sets up the Python environment.
3. Installs dependencies.
4. Runs unit tests.
5. Builds the Docker image.
6. Launch teh container 
7. Deploys the application to Azure.


Ensure that your Azure secrets are correctly configured in your GitHub repository:
1. Go to **Settings > Secrets and Variables > Actions** in GitHub.
2. Add the following secrets:
   - `AZUREAPPSERVICE_CLIENTID`
   - `AZUREAPPSERVICE_TENANTID`
   - `AZUREAPPSERVICE_SUBSCRIPTIONID`


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
