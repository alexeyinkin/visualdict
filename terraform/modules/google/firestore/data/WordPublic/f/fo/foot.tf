resource "google_firestore_document" "foot" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "foot"
  fields      = file("${path.module}/foot.json")
}
