resource "google_firestore_document" "everything" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "everything"
  fields      = file("${path.module}/everything.json")
}
