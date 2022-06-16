# Terraform-Docker-Flask-Webapp

[![Python 3.10.13](https://img.shields.io/badge/python-3.10.13-blue.svg)](https://www.python.org/downloads/release/python-31013/)

## Introduction

This project uses Terraform to run Flask API hosted on Docker.

Flask API will render the following templates [Tindog Webapp](https://github.com/bijeck/Terraform-Docker-Flask-Webapp)

There are two ways to run the application by running Dockerfile and running the terraform.

Authors: [Bijeck](https://github.com/bijeck)


## Requirements
Project uses a number of open source projects to work properly:
- [Terraform](https://www.terraform.io/downloads) - HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources.
- [Python](https://www.python.org) - Main programming language that lets project run effectively.
- [Docker Engine](https://docs.docker.com/engine/install/) - Docker Engine is an open source containerization technology for building and containerizing your applications.
- [Docker Compose](https://docs.docker.com/compose/install/) - Compose is a tool for defining and running multi-container Docker applications.


---

## Project Folder
- `src` : contains source files
- `src/templates` : contains html file
- `src/static_files` : contains css and external files for HTML files
- `terraform` : contains Terraform Configuration
- `requirements.txt` : contains python requirements packages

---

## Create Enviroment

Be Sure you have Virtulenv installed if not running below:
```sh
>> pip install virtualenv
```

After unzip the project, create a virtual environment with the following:
```sh
>> cd ETL_SuMP
>> virtualenv venv
```

Then active the virtual environment and install the packages:
```sh
# For Mac or Linux
>> source venv/bin/activate
# For windows
>> venv\Scripts\activate.bat
```

---

## Installation 
Install python packages to run project effectively:
```sh
>> pip install -r requirements.txt
```
---
## Run Project with Dockerfile

### 1) Build docker image:

- Create a Docker image from Dockerfile and set tag of image to webapp:
    ```sh
        >> docker build -t webapp .
    ```
    Workflow in Dockerfile:
    - Dockerfile will pull the Python image from Dockerhub.
    - Create app folder as root folder.
    - Copy requirements.txt to app folder and install dependencies.
    - Copy src folder to app folder.
    - Set the command will be executed when created container.

- Check the image is created successfully:
    ```sh
    >> docker images webapp
    ```

### 2) Create container from webapp image and run:

- Create a Docker container from webapp image:
    ```sh
    >> docker run -dp 5000:5000 --name webapp webapp:latest
    ```
    Python webapp uses Flask to run and port of Flask is 5000.

    So mapping the container port to localhost:5000 port.
- Check the container is running:
    ```sh
    >> docker ps -f name=webapp
    ```
- Access localhost:5000 in browser to see content.

### 3) Stop the container:
- To stop the container:
    ```sh
    >> docker stop webapp
    ```
- To remove the container:
    ```sh
    >> docker rm webapp
    ```
---

## Run Project with Terraform

### 1) Initialize terrform project:

- Initialize the terraform project with docker provider in main.tf:
    ```sh
    >> cd terraform
    >> terraform init
    ```
    All the configuation of docker provider and terraform will be downloaded.

- Plan for terraform:
    ```sh
    >> terraform plan
    ```
    Terraform will plan how to run the project.

- Run the project:
    ```sh
    >> terraform apply
    ```
    Terraform will ask for permission:
    ```sh
    >> Do you want to perform these actions?
            Terraform will perform the actions described above.
            Only 'yes' will be accepted to approve.
        Enter a value: yes
    ```
    Terraform will use webapp image and add more configuation to run container.

- Check the container is running:
    ```sh
    >> docker ps -f name=webapp
    ```
    Access localhost:5000 in browser to see content.

### 2) Stop terrform project:

- To stop terrform project:
    ```sh
    >> terraform destroy
    ```
    Terraform will ask for permission:
    ```sh
    >> Do you really want to destroy all resources?
            Terraform will destroy all your managed infrastructure, as shown above.
            There is no undo. Only 'yes' will be accepted to confirm.
        Enter a value: yes
    ```
    This command is the inverse of terraform apply in that it terminates all the resources specified in your Terraform state.

## Tindog Webapp
![tindog](/src/static_files/tindog.png)