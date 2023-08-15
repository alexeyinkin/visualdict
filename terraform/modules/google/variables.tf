variable "CREDENTIALS_FILE" {
  type = string
}

variable "KEYS_DIR" {
  type = string
}

variable "PROJECT" {
  type = string
}

variable "REGION" {
  type = string
}

variable "ZONE" {
  type = string
}

variable "ORG_ID" {
  default = "359494807460"
  type    = string
}

variable "FIRESTORE_COLLECTION_WORD_PUBLIC" {
  default = "WordPublic"
  type    = string
}
