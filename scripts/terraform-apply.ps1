$ErrorActionPreference = 'Stop'
$TerraformDir = Join-Path $PSScriptRoot '..\terraform'

terraform -chdir="$TerraformDir" init
terraform -chdir="$TerraformDir" plan
terraform -chdir="$TerraformDir" apply
