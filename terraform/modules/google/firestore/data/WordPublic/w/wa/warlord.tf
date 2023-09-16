resource "google_firestore_document" "warlord" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "warlord"
  fields      = file("${path.module}/warlord.json")
}
