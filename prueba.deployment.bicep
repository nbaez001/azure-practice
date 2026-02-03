@description('The name of the Azure storage resource')
@minLength(3)
@maxLength(24)
param storageName string

@description('The Storage account type')
@allowed([
  'Standard_LRS'
  'Standard_ZRS'
])
param storageAccountType string = 'Standard_LRS'

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageName
  tags: {
    Environment: 'dev'
  }
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: storageAccountType
  }
}

output storageEndpoint object = storage.properties.primaryEndpoints
