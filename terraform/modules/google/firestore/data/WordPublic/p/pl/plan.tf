resource "google_firestore_document" "plan" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "plan"
  fields      = file("${path.module}/plan.json")
}
