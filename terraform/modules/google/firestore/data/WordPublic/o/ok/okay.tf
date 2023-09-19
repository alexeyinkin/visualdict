resource "google_firestore_document" "okay" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "okay"
  fields      = file("${path.module}/okay.json")
}
