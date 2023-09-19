resource "google_firestore_document" "lose" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "lose"
  fields      = file("${path.module}/lose.json")
}
