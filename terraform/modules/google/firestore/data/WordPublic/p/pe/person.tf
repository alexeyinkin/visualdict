resource "google_firestore_document" "person" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "person"
  fields      = file("${path.module}/person.json")
}
