module "data" {
  source  = "./data"
  PROJECT = var.PROJECT
}

#module "indexes" {
#  source  = "./indexes"
#  PROJECT = var.PROJECT
#}

module "security_rules" {
  source  = "./security_rules"
  PROJECT = var.PROJECT
}
