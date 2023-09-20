resource "google_firestore_document" "lam" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "lam"
  fields      = file("${path.module}/lam.json")
}
