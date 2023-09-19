resource "google_firestore_document" "morning" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "morning"
  fields      = file("${path.module}/morning.json")
}
