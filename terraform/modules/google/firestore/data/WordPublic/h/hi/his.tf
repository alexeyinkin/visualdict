resource "google_firestore_document" "his" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "his"
  fields      = file("${path.module}/his.json")
}
