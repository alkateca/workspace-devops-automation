Markdown

# 🚀 Laboratório de Práticas DevOps

Laboratório desenvolvido junto ao curso [DevOps & Automação Sem Enrolação!](https://www.udemy.com/course/devops-automacao-sem-enrolacao/) para práticas de devops.

---

## 📁 Estrutura de Arquivos

Criação da estrutura inicial do projeto:

```bash
mkdir -p .github/workflows infra ansible && \
touch .github/workflows/deploy.yml \
infra/{main.tf,variables.tf,outputs.tf,terraform.tfvars} \
ansible/playbook.yml \
README.md
☁️ Configuração do Backend Terraform no Azure
Comandos para criar o storage account no Azure que armazenará o estado (.tfstate) do Terraform.

Bash

# Definição de variáveis
RESOURCE_GROUP="rg-tfstate"
STORAGE_ACCOUNT="tfstatecurso$RANDOM"
CONTAINER_NAME="tfstate"
LOCATION="eastus2"

# Criar o grupo de recursos
az group create \
--name $RESOURCE_GROUP \
--location $LOCATION

# Criar a conta de armazenamento
az storage account create \
--name $STORAGE_ACCOUNT \
--resource-group $RESOURCE_GROUP \
--location $LOCATION \
--sku Standard_LRS \
--encryption-services blob

# Criar o container de blob
az storage container create \
--name $CONTAINER_NAME \
--account-name $STORAGE_ACCOUNT \
--auth-mode login
🔑 Configuração de Secrets no GitHub Actions
Acesse Configurações > Segurança > Secrets e variáveis > Actions no seu repositório e adicione as seguintes secrets:

ADMIN_PASSWORD
Use a senha que será utilizada para o acesso SSH à máquina virtual.

Valor: <senha_do_ssh>

AZ_CREDENTIAL
Crie uma Service Principal (Entidade de Serviço) no Azure e cole o JSON de saída como valor da secret.

Bash

az ad sp create-for-rbac --name "github-actions-workflow-alkateca" \
                         --role "Contributor" \
                         --scopes "/subscriptions/<subscriptionId>" \                       
                         --sdk-auth
ARM_SUBSCRIPTION_ID
Execute o comando abaixo para obter o ID da sua subscrição do Azure.

Bash

az account show --query id --output tsv
AZURE_REGISTRY_NAME
Execute o comando abaixo para listar o nome do seu Azure Container Registry (ACR).

Bash

az acr list --output table