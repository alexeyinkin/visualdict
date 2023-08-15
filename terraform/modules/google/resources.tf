resource "google_project" "default" {
  project_id = var.PROJECT
  name       = var.PROJECT
  org_id     = var.ORG_ID
  labels = {
    "firebase" = "enabled"
  }
}

#terraform import google_project.default your-project-id
