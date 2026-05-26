# Azure web store infrastructure

This project contains Terraform infrastructure for a simple Azure Static Web App web store.

## Contents

- Terraform configuration for simple web store

## Requirements

- Terraform
- Azure CLI >= 2.86.0
- Azure subscription

For Windows:

- PowerShell

For Linux/macOS:

- Bash

## Script permissions

On Linux/macOS, make shell scripts executable if needed:

```bash
chmod +x scripts/terraform-apply.sh scripts/terraform-destroy.sh
```

## Quick start

1. Sign in to Azure:

   ```shell
   az login --tenant <tenant-id>
   ```

2. If needed, select Azure subscription:

   ```shell
   az account set --subscription "<subscription-id-or-name>"
   ```

3. Provision infrastructure.

   PowerShell:

   ```powershell
   .\scripts\terraform-apply.ps1
   ```

   Bash:

   ```bash
   ./scripts/terraform-apply.sh
   ```

4. Review Terraform outputs: resource group name, ID, and URL.
5. Destroy Azure resources when they are no longer needed.

   PowerShell:

   ```powershell
   .\scripts\terraform-destroy.ps1
   ```

   Bash:

   ```bash
   ./scripts/terraform-destroy.sh
   ```

## Roadmap

- Add Azure static web app to Terraform.
