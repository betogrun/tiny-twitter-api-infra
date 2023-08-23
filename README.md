# Tiny Twitter API Infra

This project provisions the AWS infrastructure necessary for the Tiny Twitter API.

## Prerequisites

- An AWS account.
- SSH keys generated locally.
- Visual Studio Code with the Remote - Containers extension installed.

## Initial Setup

1. **Set Up AWS Credentials**

   Firstly, renames the file `devcontainer.env.sample` to `devcontainer.env` in the `.devcontainer` directory. Then, replace the values of the following variables with your AWS credentials:

   ```bash
   AWS_DEFAULT_REGION=your_region
   AWS_PROFILE=your_profile or default
   AWS_ACCESS_KEY_ID=your_access_key
   AWS_SECRET_ACCESS_KEY=your_secret_key
  ```

  Note: **Never** commit `devcontainer.env` to source control. This is sensitive information.

2. **Generate Local SSH Keys**

  To generate an SSH key pair for your EC2 instance, run:

  ```bash
  ssh-keygen -t rsa -b 4096 -f ./ssh/tiny-twitter-api-key
  ```

3. **Launch the Development Container**

  To use the development container, you'll need to have both Visual Studio Code and the Remote - Containers extension installed. Here's a step-by-step guide:

  1. **Install Visual Studio Code:**
   If you haven't installed Visual Studio Code, you can download it from [here](https://code.visualstudio.com/).

  2. **Install the Remote - Containers Extension:**
    Inside Visual Studio Code, navigate to the Extensions view by clicking on the square icon on the sidebar or pressing Ctrl+Shift+X. Search for "Remote - Containers" and install it.

  3. **Open the Project in VS Code:**
    Navigate to the location of your project in your file system. Right-click within the folder and select "Open with Visual Studio Code."

  4. **Open the Project in a Dev Container:**
    Once inside VS Code:
    
    - Press F1 to open the command palette.
    - Type "Remote-Containers: Open Folder in Container..." and select it.
    - Choose the project folder, and VS Code will start building the development container. This process may take a few minutes the first time.

  5. **Working Inside the Dev Container:**
   Once the container is up and running, you'll notice the bottom-left corner of VS Code indicates that you're working inside the container. You can now run any command inside this isolated environment.
  
## Provision the Infrastructure

  **Please note: Deploying some infrastructure components on AWS will lead to charges on your AWS account. Before applying Terraform configurations, it's recommended to use tools like [Infracost](https://www.infracost.io/) to estimate potential costs.**

  Inside your development container, and within the main directory, follow these steps:

  1. **Initialize Terraform:**

   ```bash
   terraform init
    ```
  
  2. **Review planned changes:**

   ```bash
   terraform plan
   ```

  3. **Apply changes:**

   ```bash
    terraform apply
    ```

   Once the infrastructure setup is complete, you can access the application using the IP address provided in the output: http://<ip_address>
   You can also, access the EC2 instance using the following command:

   ```bash
    ssh -i ~/.ssh/tiny-twitter-api-key ubuntu@<ip_address>
    ```

   4. **Destroy the infrastructure:**

   You can destroy the infrastructure anytime by running:

   ```bash
    terraform destroy
    ```

## TODO: Add instructions for deploying the application.











   



   