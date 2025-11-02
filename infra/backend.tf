terraform {
    backend "azurerm" {
        resource_group_name = "rg-tfstate"
        storage_account_name = "tfstatecurso13644"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}