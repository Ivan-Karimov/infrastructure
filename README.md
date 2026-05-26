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

1. Run script. If necessary, provide Azure tenant and subscription arguments.

   PowerShell:

   ```powershell
   .\scripts\terraform-apply.ps1
   .\scripts\terraform-apply.ps1 -TenantId <tenant-id> -SubscriptionIdOrName "<subscription-id-or-name>"
   ```

   Bash:

   ```bash
   ./scripts/terraform-apply.sh
   ./scripts/terraform-apply.sh --tenant <tenant-id> --subscription "<subscription-id-or-name>"
   ```

2. Review Terraform outputs: resource group name, ID, and URL.

3. Destroy Azure resources when they are no longer needed. You can also use tenant id and/or subscription id or name.

   PowerShell:

   ```powershell
   .\scripts\terraform-destroy.ps1
   .\scripts\terraform-destroy.ps1 -TenantId <tenant-id> -SubscriptionIdOrName "<subscription-id-or-name>"
   ```

   Bash:

   ```bash
   ./scripts/terraform-destroy.sh
   ./scripts/terraform-destroy.sh --tenant <tenant-id> --subscription "<subscription-id-or-name>"
   ```

## Roadmap

- Add Azure static web app to Terraform.
