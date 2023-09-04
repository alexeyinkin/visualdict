resource "google_firestore_document" "but" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "but"
  fields      = file("${path.module}/but.json")
}
