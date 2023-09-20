resource "google_firestore_document" "class" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "class"
  fields      = file("${path.module}/class.json")
}
