resource "google_firestore_document" "break" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "break"
  fields      = file("${path.module}/break.json")
}
