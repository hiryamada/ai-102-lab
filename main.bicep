param aiservice_name string = 'ai${uniqueString(resourceGroup().id)}'
param location string = 'eastus'
resource aiservice 'Microsoft.CognitiveServices/accounts@2025-04-01-preview' = {
    name: aiservice_name
    location: location
    kind: 'ComputerVision'
    sku: { name: 'F0', tier: 'Free' }
    properties: {
        customSubDomainName: aiservice_name
    }
}
output aiservice_name string = aiservice_name
output aiservice_endpoint string = aiservice.properties.endpoint
