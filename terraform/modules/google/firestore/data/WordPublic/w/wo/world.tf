resource "google_firestore_document" "world" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "world"
  fields      = file("${path.module}/world.json")
}
