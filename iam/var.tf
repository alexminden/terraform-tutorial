variable "policies" {
  description = "The list of S3 folders to create"
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilder"
  ]
}

variable "iamName" {
  default = [
    "terraform-test-minden",
    "terraform_InstanceProfile"
  ]
}