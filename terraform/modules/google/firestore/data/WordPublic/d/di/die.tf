resource "google_firestore_document" "die" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "die"
  fields      = file("${path.module}/die.json")
}
