# end-to-end-automation
This repository contains an end-to-end automation project that deploys on AWS using Terraform, Packer, Ansible, and Jenkins. The project creates an AMI image using Packer with Ansible installed on it and then Terraform deploy required resources on AWS to host Jenkins Server. During initializing EC2 instance, required Ansible playbook files for Jenkins Installation and Configuration is cloned from [Install-jenkins](https://github.com/Majid-dev/install-jenkins) repository and executed by Ansible.

## Project Structure
- The `packer` directory contains the Packer configuration file (`aws-ami-builder.json`) to create the custom AMI image.

- The `modules` directory contains the Terraform modules (`alb, asg, launch-template, security-group, target-group, vpc`) required for provisioning whole infrastructure.

- The `.github` directory contains the Github Action files (`terraform-plan.yml` , `terraform-apply.yml`) that defines the pipeline for the infrastructure deployment.

## Prerequisites

Before running the project, ensure that you have the following prerequisites:

- An AWS account with appropriate permissions to create EC2 instances and manage AMIs.
- Terraform cloud account to store state file and deployment automation.

- Packer installed on your local machine.

## Deployment Process
To deploy the project on AWS, follow these steps:
1. Clone this repository to your local machine:
    ```bash
   git clone https://github.com/Majid-dev/end-to-end-automation
    ```
    Navigate to the packer directory and run Packer to create the custom AMI image:
    ```bash
    cd packer
    packer build aws-ami-builder.json
    ```
    This will create an AMI with Ansible installed and necessary dependencies.
    
2. Once the AMI creation is complete, Navigate to the root directory and run the following Terraform commands to provision the infrastructure:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```
    This will deploy all required resources on AWS to host Jenkins server and any other necessary configurations. Refer to the [Install-jenkins](https://github.com/Majid-dev/install-jenkins) repository documentation for setting up and configuring Jenkins jobs.
## Note:
 `You can creat your own repository for jenkins installation and configuration playbooks and place its link in launch-template module.`

## Contributing
If you'd like to contribute to this project, please follow these guidelines:
1. Fork the repository and create a new branch for your contribution.
2. Make your changes and test them thoroughly.
3. Submit a pull request, explaining the purpose and details of your contribution.
## License
This project is licensed under the MIT License.



