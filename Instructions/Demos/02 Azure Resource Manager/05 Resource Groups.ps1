# Login to Azure account
Connect-AzAccount -UseDeviceAuthentication
# Get-AzContext
# Get-AzSubscription
# Set-AzContext -Subscription "<SubscriptionId>"

# Create resource group for lab environment
New-AzResourceGroup -Name "LabEnv-rg" -Location "West Europe"

# Create lock for lab environment to prevent deletion
New-AzResourceLock -LockName "LabEnv-lck" -LockLevel CanNotDelete -ResourceGroupName "LabEnv-rg"
Get-AzResourceLock
# Remove-AzResourceLock -LockName "LabEnv-lck" -ResourceGroupName "LabEnv-rg"
