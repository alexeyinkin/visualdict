resource "google_firestore_document" "coerce" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "coerce"
  fields      = file("${path.module}/coerce.json")
}
