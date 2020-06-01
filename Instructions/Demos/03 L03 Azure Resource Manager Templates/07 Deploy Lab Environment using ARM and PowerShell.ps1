# Login to Azure account
Connect-AzAccount -UseDeviceAuthentication
# Get-AzContext
# Get-AzSubscription
# Set-AzContext -Subscription "<SubscriptionId>"

# Refer to the resource group and lock created before
Get-AzResourceGroup -Name "LabEnv-rg"
Get-AzResourceLock -ResourceGroupName "LabEnv-rg" -LockName "LabEnv-lck"
# New-AzResourceGroup -Name LabEnvRG -Location 'West Europe'
# New-AzResourceLock -LockName LabEnvLCK -LockLevel CanNotDelete -ResourceGroupName LabEnvRG

# Deploy the template into the resource group
$templateFile = ".\Instructions\Demos\Lab Environment\template.json"
New-AzResourceGroupDeployment -ResourceGroupName "LabEnv-rg" -Name "LabEnv-dpl" -TemplateFile $templateFile

# Verify the template deployed
Get-AzVM
Get-AzVM -Name "VS2019-vm" -ResourceGroupName "LabEnv-rg"
$vm = Get-AzVM -Name "VS2019-vm" -ResourceGroupName "LabEnv-rg"
$vm.HardwareProfile.vmSize = "Standard_D4s_v3"
Update-AzVM -ResourceGroupName "LabEnv-rg" -VM $vm
