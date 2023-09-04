resource "google_firestore_document" "decrepit" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "decrepit"
  fields      = file("${path.module}/decrepit.json")
}
