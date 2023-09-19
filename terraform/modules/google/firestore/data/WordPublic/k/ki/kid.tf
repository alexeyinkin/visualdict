resource "google_firestore_document" "kid" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "kid"
  fields      = file("${path.module}/kid.json")
}
