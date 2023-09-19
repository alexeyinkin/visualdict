resource "google_firestore_document" "once" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "once"
  fields      = file("${path.module}/once.json")
}
