resource "google_firestore_document" "bustle" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "bustle"
  fields      = file("${path.module}/bustle.json")
}
