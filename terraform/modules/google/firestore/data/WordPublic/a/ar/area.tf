resource "google_firestore_document" "area" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "area"
  fields      = file("${path.module}/area.json")
}
