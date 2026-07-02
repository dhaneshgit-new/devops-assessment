\# Task 2: Deploy App to AWS EC2 with Proper Security



\## VPC

Used the default VPC and its default public subnet — sufficient for a

single test instance; a custom VPC would be overkill for this scope.



\## Security Group (devops-assessment-sg)

\- SSH (port 22): restricted to my IP only (<your-ip>/32)

\- Custom TCP (port 5000): open to 0.0.0.0/0 (anywhere), so the app is

&#x20; publicly viewable in a browser



SSH is restricted to my IP because it's open to constant automated scanning

and brute-force attempts if left open to 0.0.0.0/0. Restricting it removes

that attack surface while still letting me administer the box.



\## EC2 + Docker

\- Launched a t2.micro Ubuntu 22.04 instance (Free Tier eligible)

\- Installed Docker via: sudo apt update \&\& sudo apt install -y docker.io

\- Enabled Docker: sudo systemctl enable --now docker

\- Added ubuntu user to docker group: sudo usermod -aG docker ubuntu

\- Copied app.py, requirements.txt, Dockerfile from Task 1 via scp

\- Built and ran: docker build -t flask-devops-app . \&\& docker run -d -p 5000:5000 flask-devops-app

\- Verified in browser at http://<public-ip>:5000



\## IAM

No custom IAM role was attached to this instance since it doesn't call

other AWS services. In general, least privilege means granting only the

specific permissions a resource needs (e.g. an EC2 instance that only

reads from one S3 bucket should get a role scoped to s3:GetObject on that

bucket only, not full S3 or admin access) — this limits the blast radius

if credentials are ever compromised.



\## Issues encountered

\- Initially forgot to add the port 5000 inbound rule to the security

&#x20; group, so the app wasn't reachable even though the container was running.

\- SCP failed at first due to a wrong assumption about the key file path;

&#x20; resolved by locating the actual file and confirming with Test-Path.

\- SSH session dropped once during setup; simply reconnected, files were

&#x20; preserved on the instance.

