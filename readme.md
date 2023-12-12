# Terraform + GCP Modular Project

![Terraform & GCP](images/tf_gcp.png)

## Project Description

This Terraform project aims to provide a modular and organized infrastructure setup on Google Cloud Platform (GCP). The structure is designed to handle networking, IAM (Identity and Access Management), and compute resources separately for easy management and scalability.

## Table of Contents

- [How to Install and Run the Project](#how-to-install-and-run-the-project)
  - [Prerequisites](#prerequisites)
  - [Installing Terraform](#installing-terraform)
  - [Installing Google Cloud SDK](#installing-google-cloud-sdk)
- [How to Use the Project](#how-to-use-the-project)
  - [Key Features](#key-features)
  - [Project Structure](#project-structure)
  - [Usage](#usage)
  - [Modules](#modules)
  - [Secrets](#secrets)
  - [Variables](#variables)
  - [Outputs](#outputs)
  - [Running Terraform Commands](#running-terraform-commands)
- [Additional Information](#additional-information)

## Prerequisites

Before proceeding with the installation, make sure you have the following prerequisites:

1. **Google Cloud Platform Account:**
   - Create a Google Cloud Platform account if you don't have one.
   - Set up a GCP project and note down the project ID.

### Installing Terraform

1. **Download Terraform:**
   Visit the [official Terraform website](https://www.terraform.io/downloads.html) to download the latest version of Terraform for your operating system.

### Installing Google Cloud SDK

1. **Download Google Cloud SDK:**
   Visit the [official Google Cloud SDK installation page](https://cloud.google.com/sdk/docs/install) and follow the instructions to download the SDK for your operating system.

## How to Use the Project

### Key Features

- **Modular structure:** Separate Terraform modules for VPC, network, IAM, and compute resources.
- **Variable management:** Utilizes variables for configuration and customization.
- **Outputs:** Provides output values from each module for use in subsequent modules.
- **Service account creation:** Creates a service account with appropriate roles.
- **SSH key generation:** Generates an SSH key pair for secure access to compute instances.

### Project Structure

```plaintext
tf-gcp-modular/
|-- main.tf
|-- provider.tf
|-- secrets.tfvars
|-- variables.tf
|-- compute/
   |-- main.tf
   |-- outputs.tf
   |-- variables.tf
|-- iam/
   |-- main.tf
   |-- outputs.tf
   |-- variables.tf
|-- network/
   |-- main.tf
   |-- outputs.tf
   |-- variables.tf
|-- vpc/
   |-- main.tf
   |-- outputs.tf
   |-- variables.tf
```

### Usage

1. Download the project files.
2. Configure the required variables in `variables.tf` and `secrets.tfvars`.
3. Run `terraform init` to initialize the project.
4. Run `terraform plan` to preview the planned changes.
5. Run `terraform apply` to apply the configuration.

### Modules

- **VPC:** Creates a Virtual Private Cloud (VPC) with the specified name and auto-create subnetworks option.
- **Network:** Creates a subnet within the VPC with the specified name and CIDR range.
- **IAM:** Creates a service account with the specified ID and display name. It also assigns the `roles/editor` role to the service account for the project *(Note: This role is for sandbox purposes; always use the principle of least privilege for your IAM configurations)*.
- **Compute:** Creates a compute instance with the specified name, machine type, zone, and tags. It also configures SSH access with the generated key pair, assigns the service account with appropriate scopes, and attaches a boot disk with a Debian image.
- *Note:* The SSH keys are included in the 'compute/main.tf' file. This is because there is referenced metadata in the instance formation (I'll update the repo when I make this more modular):
```hcl
  metadata = {
    ssh-keys = "tfuser:${tls_private_key.example.public_key_openssh}"
  }
  ```

### Secrets

**Edit** the `secrets.tfvars` file and provide your project info:

```hcl
# secrets.tfvars
gcp_project = "your-gcp-project-id"
region  = "your-region"
```

### Variables

- `vpc_name`: Name of the VPC (string)
- `auto_create_subnetworks`: Whether to automatically create subnetworks in the VPC (bool)
- `public_subnet_name`: Name of the public subnet (string)
- `public_subnet_cidr`: CIDR range for the public subnet (string)
- `service_account_id`: Unique ID for the service account (string)
- `service_account_display_name`: Display name for the service account (string)
- `instance_name`: Name of the compute instance (string)
- `machine_type`: Machine type for the compute instance (string)
- `zone`: Zone for the compute instance (string)
- `tags`: List of tags to assign to the compute instance (list(string))

### Outputs

- `vpc_id`: ID of the VPC (string)
- `public_subnet_id`: ID of the public subnet (string)
- `service_account_email`: Email address of the service account (string)

### Running Terraform Commands

1. **Plan the Changes:**
   Run the following command to preview the planned changes:
   ```bash
   terraform plan -var-file=secrets.tfvars
   ```

2. **Apply the Configuration:**
   To deploy all resources automatically, run the following command:
   ```bash
   terraform apply -var-file=secrets.tfvars -auto-approve
   ```
3. If you encounter the error **"Error: oauth2: 'invalid_grant' 'reauth related error (invalid_rapt)'"**, you will need to reauthenticate your session. Using the gcloud SDK, do this by running:
   ```bash
   gcloud auth application-default login
   ```
4. **Destroy the resources:** After completing your testing and exploration in the newly configured environment, ensure to execute the following command to avoid incurring any additional charges:
   ```bash
   terraform destroy -var-file=secrets.tfvars -auto-approve
   ```
<br>
---

### Additional Information

- This project is a basic example and can be customized further to meet your specific needs.
- Refer to the official Terraform documentation for detailed information on usage and configuration.

### Contributing
- Contributions are welcome!
<br><br>
---