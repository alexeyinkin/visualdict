resource "google_firestore_document" "force" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "force"
  fields      = file("${path.module}/force.json")
}
