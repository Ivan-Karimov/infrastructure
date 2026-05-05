# Azure web store infrastructure

This project contains Terraform infrastructure for Azure Static Web App for simple web store.

## Contents

- Terraform configuration for simple web store

## Requirements

- Terraform
- Azure CLI
- Azure subscription

## Quick start

1. Sign in to Azure:

   ```powershell
   az login
   ```

2. Select Azure subscription:

   ```powershell
   az account set --subscription "<subscription-id-or-name>"
   ```

3. Provision infrastructure:

   ```powershell
   .\scripts\terraform-apply.ps1
   ```

4. Review Terraform outputs: resource group name, ID and URL.
5. To destroy Azure resources when they are no longer needed:

   ```powershell
   .\scripts\terraform-destroy.ps1
   ```

## Roadmap

- Add provision and destroy scripts for Linux.
- Add Azure static web app to Terraform.
