# Azure Scenario-Based Blueprints

This is an open-source Python-based engine for generating Azure infrastructure using Terraform from scenario-driven JSON input.

## Features
- Scenario-based blueprint generation for small, medium, and enterprise environments.
- Automatic dependency management and references.
- Easily extendable with new scenarios and blueprints.
- Integrates with Terraform to provision Azure resources.

## Getting Started

### Clone the repository
```bash
git clone https://github.com/your-org/azure-scenario-blueprints.git
cd azure-scenario-blueprints

## Install requirement
pip install -r requirements.txt

## Run the engine
python3 blueprint-engine/engine.py --input inputs/example.json
