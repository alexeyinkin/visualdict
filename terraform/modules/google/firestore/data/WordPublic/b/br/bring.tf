resource "google_firestore_document" "bring" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "bring"
  fields      = file("${path.module}/bring.json")
}
