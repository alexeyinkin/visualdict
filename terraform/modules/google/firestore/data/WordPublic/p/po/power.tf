resource "google_firestore_document" "power" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "power"
  fields      = file("${path.module}/power.json")
}
