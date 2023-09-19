resource "google_firestore_document" "allow" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "allow"
  fields      = file("${path.module}/allow.json")
}
