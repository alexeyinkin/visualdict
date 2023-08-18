resource "google_firestore_document" "perquisite" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "perquisite"
  fields      = file("${path.module}/perquisite.json")
}
