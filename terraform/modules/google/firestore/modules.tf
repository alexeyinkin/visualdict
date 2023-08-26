module "data" {
  source  = "./data"
  PROJECT = var.PROJECT
  FIRESTORE_COLLECTION_WORD_PUBLIC = var.FIRESTORE_COLLECTION_WORD_PUBLIC
}

#module "indexes" {
#  source  = "./indexes"
#  PROJECT = var.PROJECT
#}

module "security_rules" {
  source  = "./security_rules"
  PROJECT = var.PROJECT
}
