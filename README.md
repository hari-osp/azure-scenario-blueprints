# Azure Scenario-Based Blueprints

This is an open-source Terraform-based engine for generating Azure infrastructure from scenario-driven JSON input. It allows users to create customizable and reusable landing zones and infrastructure resources for small, medium, and enterprise environments based on predefined scenarios.

## Prerequisites

Before you get started, ensure you have the following installed:

1. **Terraform** (version 1.0 or later)
   - [Download Terraform](https://www.terraform.io/downloads.html)

2. **Python** (version 3.7 or later)
   - [Download Python](https://www.python.org/downloads/)

3. **Azure CLI** (optional, but recommended for authentication and management)
   - [Download Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## Getting Started

To get started, clone the repository and install the required dependencies:

```bash
git clone https://github.com/hari-osp/azure-scenario-blueprints.git
cd azure-scenario-blueprints

# Install Python Dependencies
## To use the blueprint generation tool, you need to install the required Python dependencies. You can install them via pip:

pip install -r requirements.txt


# Configure Input JSON
## You can configure your infrastructure needs by defining your project requirements in a JSON file. This file specifies which scenarios to deploy, the Azure region, and any other configurations such as tags.

``` {
  "scenarios": ["small-hub-vnet", "medium-network-aks"],
  "region": "eastus",
  "project": "dev-environment",
  "tags": {
    "owner": "cloudteam",
    "env": "dev"
  }
}
```

## Run the Blueprint Generator
### After configuring the JSON input, use the engine.py to generate the Terraform code based on the defined scenarios:

python3 blueprint-engine/engine.py --input inputs/example.json

## The tool will generate a Terraform script at blueprints/generated-landingzone.tf.


About
This tool is designed to simplify the process of deploying Azure infrastructure based on predefined scenarios. By using a simple JSON configuration, users can automatically generate the Terraform code necessary to deploy Azure resources. It supports various use cases, from simple web app deployments to complex enterprise-level infrastructure setups.

Supported Scenarios:
small-hub-vnet: A simple VNet with two subnets.

medium-network-aks: An AKS cluster deployed in a VNet.

enterprise-sql-failover: A SQL Managed Instance setup with a failover group for high availability.

small-web-app: A simple web app with Azure App Service and SQL Database.

medium-storage-blob: Azure Blob Storage with private access.

enterprise-networking: A network setup with multiple VNets, peering, and network security groups.

Additional scenarios can be added to the scenarios/ directory as needed.

Benefits of This Approach
1. Reusable Infrastructure Patterns
Predefined scenarios enable rapid deployment of common Azure infrastructure setups.

Users can extend and customize these scenarios according to their specific needs.

2. Scenario-based Infrastructure Provisioning
Rather than manually creating each resource, users can define the desired outcome through scenarios.

Supports multiple tiers (small, medium, enterprise) for quick deployments in different environments.

3. Faster Time to Market
Quickly generate Terraform configurations with minimal manual effort, which reduces setup time and human errors.

Ideal for environments that need quick provisioning of standardized setups like dev, test, or production environments.

4. Simplifies Dependency Management
Built-in dependency resolution ensures that resources are created in the correct order, avoiding issues like a VM being created without an available subnet or network interface.

5. Customizable for Various Use Cases
The platform is extensible and can be modified to accommodate different infrastructure requirements, whether it's simple resources or complex, multi-region setups.

Scenarios can be adapted to meet the needs of different industries or business models, such as networking, security, or compute.

6. Integration with Other Tools
This solution can integrate with other automation tools such as Azure DevOps, Jenkins, and GitLab for CI/CD pipelines.

It can also be used with infrastructure-as-code policies and governance tools like Azure Policy or custom scripts.

7. Open-Source and Community-Driven
Being an open-source project, it is available for modification, enhancement, and contribution by anyone.

Community-driven development ensures continuous improvement and new feature additions.