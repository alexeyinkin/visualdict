resource "google_firestore_document" "death" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "death"
  fields      = file("${path.module}/death.json")
}
