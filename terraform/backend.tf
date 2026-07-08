# Remote state backend (S3).
#
# The state bucket must exist before Terraform can use it as a backend, so
# the recommended bootstrap flow is:
#
#   1. First run WITHOUT this backend (leave the block below commented out):
#        terraform init
#        terraform apply
#      This creates your infrastructure using local state.
#
#   2. Create an S3 bucket to hold remote state (either manually, or add a
#      dedicated aws_s3_bucket resource and apply it). Enable versioning on
#      that bucket. Optionally create a DynamoDB table for state locking.
#
#   3. Uncomment the backend block below and fill in your bucket name, then
#      migrate the existing local state into S3:
#        terraform init -migrate-state
#
# terraform {
#   backend "s3" {
#     bucket       = "portfolio-site-tfstate"   # your state bucket name
#     key          = "portfolio-site/terraform.tfstate"
#     region       = "ap-south-1"
#     encrypt      = true
#     use_lockfile = true                        # S3-native state locking
#   }
# }
