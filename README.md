# 🚀 EKS Public Cluster Deployment with DevSecOps CI/CD (Terraform + GitHub Actions)

## 📌 Overview

This project provisions an AWS EKS public cluster, ECR repository, and supporting infrastructure using **Terraform**, with a secure, automated CI/CD pipeline powered by **GitHub Actions**.  
The pipeline integrates **DevSecOps** tools like **Checkov**, **Trivy**, and **npm audit** for security scanning and sends status updates to a Slack channel.

---

## 📂 Project Structure

├── terraform/
│ ├── app/
│ │ ├── Dockerfile
│ │ ├── server.js
│ │ ├── package.json
│ │ └── package-lock.json
│ ├── k8s/
│ │ ├── deployment.yaml
│ │ └── service.yaml
│ ├── main.tf
│ └── variables.tf
├── .github/
│ └── workflows/
│ ├── build-push-ecr.yml
│ └── destroy-infra.yml
└── README.md


---

## 📈 CI/CD Workflows

### ✅ Build & Deploy Pipeline: `build-push-ecr.yml`

Triggered manually via **workflow_dispatch**.

**Steps:**
- ✅ Checkov scan for Terraform security issues
- ✅ `terraform apply` to provision infra
- ✅ Install dependencies and run `npm audit`
- ✅ Build Docker image
- ✅ Push image to ECR
- ✅ Trivy image scan for vulnerabilities
- ✅ Trivy config scan for Dockerfile and K8s manifests
- ✅ Slack notification on failure

---

### ✅ Destroy Pipeline: `destroy-infra.yml`

Triggered manually via **workflow_dispatch**.

**Steps:**
- ✅ Checkov scan before destroy
- ✅ `terraform destroy` for EKS cluster, ECR repository, node groups, and VPC  
  (excludes S3 backend bucket and DynamoDB state table)
- ✅ Optional: `kubectl delete` for Kubernetes resources
- ✅ Slack notifications on both success and failure

---

## 🔐 DevSecOps Integrations

| Tool     | Purpose                          | Runs in |
|:----------|:--------------------------------|:-----------|
| Checkov   | Scans Terraform infrastructure  | Both pipelines |
| npm audit | Checks Node.js dependencies     | Build pipeline |
| Trivy (image)  | Scans Docker images for vulnerabilities | Build pipeline |
| Trivy (config) | Scans Dockerfile and Kubernetes YAMLs | Build pipeline |
| Slack Notifications | Sends status alerts to Slack | Both pipelines |

---

## 📱 Slack Setup

1. Create a [Slack incoming webhook](https://api.slack.com/messaging/webhooks).
2. Add it to your GitHub secrets as `SLACK_WEBHOOK_URL`.

---

## 📦 Required GitHub Secrets

| Name                | Purpose                |
|:--------------------|:----------------------|
| `AWS_ACCESS_KEY_ID`  | AWS IAM Access Key     |
| `AWS_SECRET_ACCESS_KEY` | AWS IAM Secret Key |
| `AWS_REGION`         | AWS region (e.g. ap-south-1) |
| `SLACK_WEBHOOK_URL`  | Slack incoming webhook URL |

---

## 🚀 Trigger Pipelines

### Build & Deploy  
→ From GitHub Actions tab → **Build, Scan, and Push to ECR**

### Destroy  
→ From GitHub Actions tab → **Destroy EKS, ECR and Infra**

---

## 📊 Clean, secure, fully automated infra delivery — with built-in DevSecOps ✅


