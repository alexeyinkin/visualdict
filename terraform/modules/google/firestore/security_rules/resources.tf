resource "google_firebaserules_release" "default" {
  name         = "cloud.firestore"
  ruleset_name = "projects/${var.PROJECT}/rulesets/${google_firebaserules_ruleset.default.name}"
  project      = var.PROJECT
}

resource "google_firebaserules_ruleset" "default" {
  source {
    files {
      content = file("${path.module}/firestore.rules")
      name    = "firestore.rules"
    }
  }
  project = var.PROJECT
  lifecycle {
    create_before_destroy = true
  }
}

# TODO: Check if this is required:
# terraform import module.firestore.module.security_rules.google_firebaserules_release.default projects/PROJECT/releases/cloud.firestore
