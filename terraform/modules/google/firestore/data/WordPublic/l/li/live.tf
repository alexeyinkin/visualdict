resource "google_firestore_document" "live" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "live"
  fields      = file("${path.module}/live.json")
}
