set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TERRAFORM_DIR="$SCRIPT_DIR/../terraform"
TENANT_ID=""
SUBSCRIPTION_ID_OR_NAME=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --tenant)
            TENANT_ID="${2:?Missing value for --tenant}"
            shift 2
            ;;
        --subscription)
            SUBSCRIPTION_ID_OR_NAME="${2:?Missing value for --subscription}"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [--tenant <tenant-id>] [--subscription <subscription-id-or-name>]"
            exit 0
            ;;
        *)
            echo "Unknown argument: $1" >&2
            echo "Usage: $0 [--tenant <tenant-id>] [--subscription <subscription-id-or-name>]" >&2
            exit 1
            ;;
    esac
done

if [[ -n "$TENANT_ID" ]]; then
    if [[ -n "$SUBSCRIPTION_ID_OR_NAME" ]]; then
        az login --tenant "$TENANT_ID" --subscription "$SUBSCRIPTION_ID_OR_NAME"
    else
        az login --tenant "$TENANT_ID"
    fi
else
    if [[ -n "$SUBSCRIPTION_ID_OR_NAME" ]]; then
        az login --subscription "$SUBSCRIPTION_ID_OR_NAME"
    else
        az login
    fi
fi

az account show --query "{tenantId:tenantId, subscriptionId:id, name:name}" --output table

echo
echo "Continue with Terraform destroy using this Azure account?"
echo "Type 'destroy' to continue"
read -r confirmation

if [[ "$confirmation" != "destroy" ]]; then
    echo "Aborted."
    exit 1
fi

terraform -chdir="$TERRAFORM_DIR" init
terraform -chdir="$TERRAFORM_DIR" destroy
