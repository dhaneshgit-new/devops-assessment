\# Task 1: Dockerize and CI/CD a Simple Web App



\## What this does

A minimal Flask app with one route (`/`) that returns "Hello, DevOps!".

Containerized with Docker, and built/tested automatically on every push to

`main` via GitHub Actions.



\## Run locally

python -m venv venv

venv\\Scripts\\activate

pip install -r requirements.txt

pytest

python app.py



\## Run with Docker

docker build -t flask-devops-app .

docker run -p 5000:5000 flask-devops-app



\## CI/CD pipeline

Triggers on push to main. Stages: install dependencies -> run tests -> build Docker image.



\## Issues encountered

\- Notepad's Save dialog initially saved files with wrong names/extensions

&#x20; (e.g. Dockerfile.txt instead of Dockerfile) — fixed by opening Notepad

&#x20; with the full target path and using Ctrl+S instead of File > Save As.

\- Had to reinstall Git/Terraform and fix PATH issues on Windows.

\- First push failed with a 403 permission error due to cached credentials

&#x20; for a different GitHub account — fixed by clearing Windows Credential

&#x20; Manager entries for github.com.

