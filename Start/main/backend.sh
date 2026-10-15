
#!/bin/bash

# 1. ENFORCE UNIQUE STORAGE NAME: Azure Storage names must be globally unique and 3-24 lowercase alphanumeric characters.
# Changed 'gautfsatealva' to a cleaner variant, but feel free to tweak if it's already unique to you.
RESOURCE_GROUP_NAME="tfstate-rg"
STORAGE_ACCOUNT_NAME="gautfstatestudent" 
CONTAINER_NAME="tfstate"

# 2. SELECT THE RIGHT REGION: 'southindia' is supported, but student subscriptions sometimes have tighter quotas there. 
# If 'southindia' throws a quota error, change this to 'eastus' or 'westeurope'.
LOCATION="centralindia"

# Create resource group
az group create --name "$RESOURCE_GROUP_NAME" --location "$LOCATION"

# Create storage account (Added --allow-blob-public-access false for security best practices)
az storage account create \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --name "$STORAGE_ACCOUNT_NAME" \
  --sku Standard_LRS \
  --encryption-services blob \
  --allow-blob-public-access false

# Create blob container (Added --auth-mode login to ensure it uses your login credentials seamlessly)
az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --auth-mode login
