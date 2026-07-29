module "network" {
    source = "./Modules/network"
    
for_each = var.COMPONENT
COMPONENT = each.key
env = "dev"


}