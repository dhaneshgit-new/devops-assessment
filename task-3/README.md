\# Task 3: Infrastructure as Code with Terraform



\## What each resource does

\- \*\*aws\_s3\_bucket.app\_bucket\*\*: creates an S3 bucket to store app-related

&#x20; data/artifacts.

\- \*\*aws\_s3\_bucket\_public\_access\_block.app\_bucket\_block\*\*: explicitly blocks

&#x20; all public access to that bucket (best practice — S3 buckets should never

&#x20; be publicly accessible by default).

\- \*\*aws\_security\_group.app\_sg\*\*: recreates the same network rules as Task 2

&#x20; - SSH (22) restricted to my IP only

&#x20; - HTTP (5000) open to everyone, so the app is publicly viewable

\- \*\*aws\_instance.app\_server\*\*: a t2.micro Ubuntu EC2 instance using the

&#x20; security group above, ready to run the same Docker app from Tasks 1-2.



\## Variables

Defined in variables.tf: aws\_region, my\_ip, instance\_type, bucket\_name.

No values are hardcoded in main.tf — everything is passed in via -var

flags or a tfvars file, so the same config can be reused for different

regions/IPs/instance sizes without editing the code.



\## Why .tfstate is not committed

.tfstate contains the real-world state of the infrastructure, including

resource IDs, IPs, and sometimes sensitive data. Committing it to Git

risks leaking that data publicly and causes state conflicts if multiple

people run Terraform against the same config. State should live in a

secure, shared backend (e.g. S3 + DynamoDB locking) in a real team

setup instead of being committed to source control.



\## How to run

terraform init

terraform plan -var="my\_ip=<your-ip>/32" -var="bucket\_name=<unique-name>" -out=tfplan

terraform show tfplan > plan\_output.txt



\## Issues encountered

\- Terraform wasn't on PATH after extracting the zip; fixed by adding the

&#x20; extracted folder to the Windows PATH environment variable and opening a

&#x20; fresh terminal window.

\- S3 bucket names must be globally unique across all AWS accounts, so had

&#x20; to pick a sufficiently unique name.

