resource "google_firestore_document" "suave" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "suave"
  fields      = file("${path.module}/suave.json")
}
