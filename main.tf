module "network" {
  source = "./modules/network"

  for_each =  var.components

  component = each.key
  env = "dev"

}