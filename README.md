🚀 Hello World Java Microservice Deployment
This repository contains a simple Java "Hello World" application and the necessary DevOps pipeline and Infrastructure-as-Code (IaC) files to automatically build, containerize, and deploy the application.

It serves as a demonstration of a multi-stage CI/CD pipeline and deployment to a Kubernetes cluster.
🎯 Key DevOps Objectives Demonstrated 
This project showcases expertise in the following key areas:
Multi-Stage Docker Builds: Creating a small, efficient, and secure container image.
GitLab CI/CD & GitHub Actions: Implementing two distinct, automated CI/CD pipelines for build and push.
Container Registry Integration: Securely authenticating and pushing images to both GitLab Container Registry and GitHub Container Registry (GHCR).
Kubernetes Deployment: Defining the necessary resource manifest files (Deployment and Service).
That's a great collection of files for a portfolio project! For a DevOps project, a well-structured README is essential. It serves as your documentation, explaining the what, why, and how of the entire system.
Here is a template for a comprehensive README.md for your "Hello World Java Microservice" project, focusing on the DevOps pipeline you've built.

🚀 Hello World Java Microservice Deployment
This repository contains a simple Java "Hello World" application and the necessary DevOps pipeline and Infrastructure-as-Code (IaC) files to automatically build, containerize, and deploy the application.
It serves as a demonstration of a multi-stage CI/CD pipeline and deployment to a Kubernetes cluster.

🎯 Key DevOps Objectives Demonstrated
This project showcases expertise in the following key areas:
Multi-Stage Docker Builds: Creating a small, efficient, and secure container image.
GitLab CI/CD & GitHub Actions: Implementing two distinct, automated CI/CD pipelines for build and push.
Container Registry Integration: Securely authenticating and pushing images to both GitLab Container Registry and GitHub Container Registry (GHCR).
Kubernetes Deployment: Defining the necessary resource manifest files (Deployment and Service).

⚙️ Architecture and Workflow
The system is structured around the following flow:
Code Change: A push to the main branch triggers the CI/CD pipeline.
Container Build: The CI/CD job executes the Dockerfile to build the Java application into an Alpine-based JRE container image.
Image Push: The resulting image is tagged and pushed to the configured Container Registry (either GitLab or GHCR).
Kubernetes Deployment: The deployment.yaml and service.yaml files are used to deploy the latest image to a Kubernetes cluster. The Deployment uses an imagePullSecret to securely fetch the image.






📁 Repository Structure

File/Directory                                     Description                                                              Key Technologies
HelloWorld.java                         The simple Java source code file.                                                        Java 
Dockerfile                             Multi-stage Docker build file to compile the Java code (JDK stage) 
                                          and create a minimal JRE runtime image (JRE stage).                           Docker, JDK 21, JRE 21
                                          
.gitlab-ci.yml                         GitLab CI pipeline definition for building and pushing the image to the 
                                      GitLab Container Registry. Includes hardcoded credentials, intended for 
                                      demonstration purposes only.                                                        GitLab CI, Docker-in-Docker (dind)
                                      
gradle-publish.yml                  GitHub Actions workflow definition for building and pushing the image to
                                   the GitHub Container Registry (GHCR). Uses secrets.GITHUB_TOKEN for secure login.       GitHub Actions, GHCRde
                                   
ployment.yaml                        Kubernetes Deployment manifest. Specifies the replica count, container image, 
                                    and includes a ghcr-secret for image pulling.                                           Kubernetes, YAML
                                    
service.yaml                          Kubernetes Service manifest (NodePort type). Exposes the Deployment externally 
                                        on port 80, routing traffic to container port 8080.                                 Kubernetes, YAML

🐳 Docker Multi-Stage Build Breakdown
The Dockerfile employs a multi-stage build pattern for efficiency:
Builder Stage: Uses the larger eclipse-temurin:21-jdk-alpine image to copy HelloWorld.java and compile it using javac HelloWorld.java.
Runtime Stage: Switches to the smaller eclipse-temurin:21-jre-alpine image. It copies only the compiled HelloWorld.class file from the builder stage and sets the entry point to run the class.              



🚀 Deployment to Kubernetes
The deployment is managed via two core Kubernetes manifests:
1. deployment.yaml
Image: The Deployment is configured to pull the latest image from ghcr.io/omid-mosayebi/hello-world-java:latest.
Security: It uses the imagePullSecrets named ghcr-secret to authenticate with the GitHub Container Registry.
Container Port: The application runs internally on port 8080.
2. service.yaml
Type: A NodePort Service is used for demonstration, making the application accessible on a specific port on every node in the cluster.
Mapping: Traffic hitting the Service on port 80 is routed to the container's exposed port 8080.



