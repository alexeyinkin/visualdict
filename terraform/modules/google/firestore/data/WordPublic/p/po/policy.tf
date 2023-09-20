resource "google_firestore_document" "policy" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "policy"
  fields      = file("${path.module}/policy.json")
}
