variable "project" {
  type        = string
  description = "Project name."
}
variable "token" {
  type        = string
  ephemeral   = true
  sensitive   = true
  description = "Security token or IAM token used for authentication."
}
variable "cloud_id" {
  type        = string
  description = "The ID of the Cloud to apply any resources to."
}
variable "folder_id" {
  type        = string
  description = "The ID of the Folder to operate under."
}
variable "zone" {
  type        = string
  description = "The default availability zone to operate under."
}
variable "ssh_username" {
  type        = string
  description = "Specifies the user to log in as on the remote machine."
}
variable "ssh_key_file" {
  type        = string
  description = "A file from which the identity (private key) is read."
}
