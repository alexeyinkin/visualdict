resource "google_firestore_document" "member" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "member"
  fields      = file("${path.module}/member.json")
}
