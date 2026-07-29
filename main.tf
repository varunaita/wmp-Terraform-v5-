module "network" {
    source = "./Modules/network"
    
for_each = var.components
component = each.key
env = "dev"


}