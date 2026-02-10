targetScope = 'subscription'

resource newrg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg1'
  location: 'West US'
}

module vNetModule './vnet.bicep' = {
  name: 'vnetdeployment'
  scope: newrg
}
