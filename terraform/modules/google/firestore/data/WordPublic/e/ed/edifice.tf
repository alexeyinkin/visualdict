resource "google_firestore_document" "edifice" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "edifice"
  fields      = file("${path.module}/edifice.json")
}
