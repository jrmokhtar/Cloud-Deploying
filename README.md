# **☁️ CloudDeployer ☁️**

## **Overview**

Deploying a scalable and automated infrastructure on AWS using Terraform, Ansible, Docker, Kubernetes, and Jenkins. The infrastructure includes an EKS cluster, RDS instance, EC2 instance for Jenkins, and various AWS services for monitoring and logging. Jenkins pipelines are used for continuous integration and deployment of Dockerized applications onto Kubernetes.

## **Prerequisites**

Before starting, ensure you have the following prerequisites installed and configured:

- AWS CLI
- Terraform
- Ansible
- Docker
- kubectl
- Git

## **Setup Instructions**

### **1. Terraform**

- **EKS Cluster**: Create an EKS cluster with two nodes, auto-scaling group, and ELB.
- **RDS Instance**: Provision an RDS instance and store the credentials securely in AWS Secrets Manager.
- **EC2 Instance for Jenkins**: Set up an EC2 instance for running Jenkins.
- **Backup Jenkins Instance**: Configure AWS Backup Service to create daily snapshots of the Jenkins instance.
- **ELB Access Logs**: Enable access logging on ELB and store logs in an S3 bucket.
- **AWS ECR**: Create an AWS ECR repository to store Docker images.

### **2. Ansible**

- **Jenkins Installation**: Use Ansible to install Jenkins, including configuring plugins and settings.
- **CloudWatch Agent**: Install the CloudWatch agent on all EC2 instances for monitoring.

### **3. Docker**

- **Docker Images**: Build Docker images for the application code.
- **Docker Compose**: Create a Docker Compose file to run the application locally.

### **4. Kubernetes**

- **Kubernetes Manifests**: Define Kubernetes manifests to deploy the application onto the EKS cluster.
- **Network Policies**: Implement network policies to restrict traffic between pods.

### **5. Jenkins**

- **Multi-Branch Pipeline**: Set up a multi-branch pipeline in Jenkins to trigger builds and deployments on GitHub branch pushes.
- **Pipeline Stages**:
  - Build Docker images from the repository.
  - Push Docker images to ECR.
  - Deploy new images to Kubernetes pods.

## **Usage**

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/jrmokhtar/AWS-EKS-TERRAFORM.git

2. Follow the setup instructions provided above to deploy the infrastructure and configure the application.
3. Monitor the Jenkins pipeline for automated builds and deployments triggered by GitHub pushes

## **Contributing**
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## **License**
This project is licensed under the [MIT License](LICENSE).

🚀 Happy deploying! 🌟
