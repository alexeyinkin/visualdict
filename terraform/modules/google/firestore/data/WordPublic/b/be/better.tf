resource "google_firestore_document" "better" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "better"
  fields      = file("${path.module}/better.json")
}
