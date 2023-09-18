resource "google_firestore_document" "really" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "really"
  fields      = file("${path.module}/really.json")
}
