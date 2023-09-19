resource "google_firestore_document" "university" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "university"
  fields      = file("${path.module}/university.json")
}
