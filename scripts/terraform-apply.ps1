param(
    # Azure tenant Id
    [Parameter(Mandatory = $false)]
    [string]$TenantId,

    # Azure subscription Id or name
    [Parameter(Mandatory = $false)]
    [string]$SubscriptionIdOrName
)

$PSNativeCommandUseErrorActionPreference = $true
$ErrorActionPreference = 'Stop'
$TerraformDir = Join-Path $PSScriptRoot '..\terraform'

if ($TenantId) {
    if ($SubscriptionIdOrName) {
        az login --tenant $TenantId --subscription "$SubscriptionIdOrName"
    }
    else {
        az login --tenant $TenantId
    }
}
else {
    if ($SubscriptionIdOrName) {
        az login --subscription "$SubscriptionIdOrName"
    }
    else {
        az login
    }
}

az account show --query "{tenantId:tenantId, subscriptionId:id, name:name}" --output table

Write-Host
Write-Host "Continue with Terraform apply using this Azure account?"
Write-Host "Type 'yes' to continue"
$confirmation = Read-Host

if ($confirmation -ne 'yes') {
    Write-Host "Aborted."
    exit 1
}

terraform -chdir="$TerraformDir" init
terraform -chdir="$TerraformDir" plan
terraform -chdir="$TerraformDir" apply
