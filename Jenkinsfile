pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE_NAME = <Image-Name> 
        ECR_REPO_URL = <ECR_REPO_URL>
        AWS_DEFAULT_REGION = <Region>
        K8S_YAML_FILE = <deployment-file-name>
        DOCKER_TAG = "${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"
    }

    stages {
        stage('Build The Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Authenticate Docker with ECR') {
            steps {
                script {
                    sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${ECR_REPO_URL}"
                }
            }
        }

        stage('Taging The Image') {
            steps {
                script {
                    sh "docker tag ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} ${ECR_REPO_URL}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Push Docker image to ECR') {
            steps {
                script {
                    sh "docker push ${ECR_REPO_URL}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Update YAML file') {
            steps {
                script {
                    sh "sed -i 's#image:.*#image: ${ECR_REPO_URL}:${BUILD_NUMBER}#' ${K8S_YAML_FILE}"
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                script {
                    echo "Last Step: Deploying to EKS"
                    sh "kubectl apply -f ${K8S_YAML_FILE}"
                }
            }
        }
    }
}
