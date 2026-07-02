"# devops-assessment"# DevOps Practical Assessment



Submission for the Junior DevOps Engineer practical assessment.



\## Structure

\- `task-1/` — Dockerized Flask app with GitHub Actions CI/CD pipeline

\- `task-2/` — App deployed to AWS EC2 with a secured Security Group

\- `task-3/` — Same infrastructure defined as code using Terraform



Each folder contains its own README.md with details, commands used, and

issues encountered.



\## CI/CD workflow

The pipeline definition lives at `.github/workflows/ci.yml` (GitHub Actions

requires workflows at the repo root, not inside task-1/) and runs

automatically on every push to `main`.

