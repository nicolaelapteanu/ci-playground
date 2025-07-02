# CI Playground - AWS Infrastructure with Terraform

This repository contains Terraform configurations to deploy AWS infrastructure with Lambda, DynamoDB, and SQS. The infrastructure is designed to be deployed to multiple environments (dev and prod) with proper separation and tagging.

## Directory Structure

```
terraform/
├── backend/       # Remote State configuration
├── modules/       # Terraform modules
│   ├── dynamodb/
│   ├── helm/
│   ├── iam/
│   ├── lambda/
│   └── sqs/
├── environments/  # Environment configurations
│   ├── dev/
│   └── prod/
└── lambda/        # Lambda source code
```

## Features

### Generic Requirements
- **S3 backend**
- **Separate configurations for dev and prod**
- **Least privilege access control**
- **Environment Tagging**

## Deployment Instructions

### 1. Initialize Backend Infrastructure

First, deploy the backend infrastructure (S3 bucket and DynamoDB table for state management):

```bash
cd terraform/backend
terraform init
terraform plan
terraform apply
```

### 2. Prepare Lambda Function

Build and package the Lambda function:

```bash
cd lambda
npm install
npm run package
```

### 3. Deploy Development Environment

```bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

### 4. Deploy Production Environment

```bash
cd terraform/environments/prod
terraform init
terraform plan
terraform apply
```

## Configuration

### Environment Variables

### Customization

You can customize the deployment by modifying:

- `variables.tf` file for environment-specific values
- Module variables for resource-specific configurations
