resource "google_firestore_document" "coy" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "coy"
  fields      = file("${path.module}/coy.json")
}
