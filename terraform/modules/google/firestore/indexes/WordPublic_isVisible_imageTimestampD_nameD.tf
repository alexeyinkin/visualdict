resource "google_firestore_index" "WordPublic_isVisible_imageTimestampD_nameD" {
  project = var.PROJECT

  collection = "WordPublic"

  fields {
    field_path = "isVisible"
    order      = "ASCENDING"
  }

  fields {
    field_path = "image.timestamp"
    order      = "DESCENDING"
  }

  fields {
    field_path = "__name__"
    order      = "DESCENDING"
  }
}
