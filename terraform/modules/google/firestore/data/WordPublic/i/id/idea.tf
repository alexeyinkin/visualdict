resource "google_firestore_document" "idea" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "idea"
  fields      = file("${path.module}/idea.json")
}
