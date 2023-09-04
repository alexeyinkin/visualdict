resource "google_firestore_document" "abscission" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "abscission"
  fields      = file("${path.module}/abscission.json")
}
