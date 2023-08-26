module "firebase_hosting" {
  source  = "./firebase_hosting"
  PROJECT = var.PROJECT
}

module "firestore" {
  source  = "./firestore"
  PROJECT = var.PROJECT
  FIRESTORE_COLLECTION_WORD_PUBLIC = var.FIRESTORE_COLLECTION_WORD_PUBLIC
}

#module "identity_platform" {
#  source  = "./identity_platform"
#  PROJECT = var.PROJECT
#}
