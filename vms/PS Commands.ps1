$resourceGroup = 'rg-dev-03'
$storageName = 'strdev011'

$parameters = @{
    'configurationPath' = '.\webserver-install.ps1'
    'resourceGroupName' = $resourceGroup
    'storageAccountName' = $storageName
}

Publish-AzVMDscConfiguration @parameters -force -Verbose



$vmName = 'vm01'
$parameters = @{
    'Version' = 2.22
    'resourceGroupName' = $resourceGroup
    'VMName' = $vmName
    'ArchiveStorageAccountName' = $storageName
    'ArchiveBlobName' = 'webserver-install.ps1.zip'
    'AutoUpdate' = $true
    'ConfigurationName' = 'webserver'
}

Set-AzVMDscExtension @parameters -Verbose