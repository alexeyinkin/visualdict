resource "google_firestore_index" "WordPublic_isVisible_ofTheDayD_nameD" {
  project = var.PROJECT

  collection = "WordPublic"

  fields {
    field_path = "isVisible"
    order      = "ASCENDING"
  }

  fields {
    field_path = "ofTheDay"
    order      = "DESCENDING"
  }

  fields {
    field_path = "__name__"
    order      = "DESCENDING"
  }
}
