#az login --allow-no-subscriptions

appServicePlan="freeServicePlan"
resourceGroup="RG_Services4Chess"
runtimeEnv="PYTHON:3.10"
#az appservice list-locations --sku F1
location="switzerlandnorth"
#services for chess
webapp=s4chess

gitrepo=https://github.com/littlecapa/ChessServices


# Create a resource group.
echo "Creating $resourceGroup in "$location"..."
az group create --name $resourceGroup --location $location --tag $tag

# Create an App Service plan in `FREE` tier.
echo "Creating $appServicePlan"
az appservice plan create --name $appServicePlan --resource-group $resourceGroup --sku FREE --is-linux

# Create a web app.
echo "Creating $webapp"
az webapp create --name $webapp --resource-group $resourceGroup --plan $appServicePlan  --runtime $runtimeEnv

# Deploy code from a public GitHub repository. 
echo "Deploy"
az webapp deployment source config --name $webapp --resource-group $resourceGroup \
--repo-url $gitrepo --branch master --manual-integration

#az group delete --name "RG_Services4Chess"
