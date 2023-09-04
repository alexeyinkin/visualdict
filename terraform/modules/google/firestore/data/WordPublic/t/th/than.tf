resource "google_firestore_document" "than" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "than"
  fields      = file("${path.module}/than.json")
}
