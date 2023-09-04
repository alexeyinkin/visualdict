resource "google_firestore_document" "come" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "come"
  fields      = file("${path.module}/come.json")
}
