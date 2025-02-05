# VPC Infrastructure

This repository contains the Terraform infrastructure code for managing Virtual Private Cloud (VPC) resources. It provides a foundation for network infrastructure used by other components of the video analysis platform.

## Architecture Overview

The VPC infrastructure includes:
- Multiple availability zones for high availability
- Public and private subnets
- NAT Gateways for private subnet internet access
- VPC endpoints for AWS services
- Network ACLs and Security Groups for access control

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- S3 bucket for Terraform state (specified in backend configuration)

## Repository Structure

```
vpc-infrastructure/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── modules/
│   ├── vpc/
│   ├── security-groups/
│   └── endpoints/
├── backend/
│   └── backend.tf
└── README.md
```

## Module Descriptions

### VPC Module
Core networking components including subnets, route tables, and internet gateways.

### Security Groups Module
Defines and manages security group rules for different resource types.

### Endpoints Module
Manages VPC endpoints for AWS services integration.

## Usage

1. Initialize Terraform with the appropriate backend:
```bash
terraform init -backend-config=backend/backend.tf
```

2. Select the appropriate environment:
```bash
cd environments/<env>
```

3. Review and apply changes:
```bash
terraform plan
terraform apply
```

## State Management

Terraform state is stored in S3 with the following configuration:
- Bucket: `<bucket-name>`
- Key: `vpc/<environment>/terraform.tfstate`
- Region: `<region>`
- DynamoDB Table for State Locking: `<table-name>`

## Security Considerations

- All resources are deployed within VPC boundaries
- Network ACLs and Security Groups follow least privilege principle
- VPC Flow Logs are enabled for network monitoring
- Private subnets are isolated from direct internet access

## Contributing

1. Create a feature branch from main
2. Make changes following the coding standards
3. Run `terraform fmt` and `terraform validate`
4. Submit a pull request with detailed description

## Monitoring and Logging

- VPC Flow Logs are stored in CloudWatch Logs
- CloudWatch metrics for NAT Gateway and VPC endpoints
- AWS Config rules for compliance monitoring

## Contact

For questions or issues, please contact:
- Infrastructure Team: `<srawlins@gmail.com>`
- Repository Maintainers: `<maintainers-list>`