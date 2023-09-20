resource "google_firestore_document" "appear" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "appear"
  fields      = file("${path.module}/appear.json")
}
