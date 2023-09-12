resource "google_firestore_document" "scuttlebutt" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "scuttlebutt"
  fields      = file("${path.module}/scuttlebutt.json")
}
