resource "google_firestore_document" "cut" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "cut"
  fields      = file("${path.module}/cut.json")
}
