resource "google_firestore_document" "caustic" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "caustic"
  fields      = file("${path.module}/caustic.json")
}
