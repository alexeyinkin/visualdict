resource "google_firestore_document" "team" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "team"
  fields      = file("${path.module}/team.json")
}
