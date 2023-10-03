resource "google_firestore_document" "dexterity" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "dexterity"
  fields      = file("${path.module}/dexterity.json")
}
