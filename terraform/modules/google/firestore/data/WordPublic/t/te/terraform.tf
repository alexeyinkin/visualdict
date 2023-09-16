resource "google_firestore_document" "terraform" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "terraform"
  fields      = file("${path.module}/terraform.json")
}
