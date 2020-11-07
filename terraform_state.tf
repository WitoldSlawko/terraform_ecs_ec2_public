terraform {
  required_version = ">= 0.12.4"

  backend "s3" {
    bucket         = "terraform-state-storing"
    key            = "ecs_ec2.tfstate"
    profile        = "wiciu-admin"
    region         = "us-east-1"
    # dynamodb_table = "terraform_state_lock"
    encrypt        = true
  }
}

# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "terraform-state-storing"
#   versioning {
#     enabled = true
#   }
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }

# resource "aws_dynamodb_table" "terraform_state_lock" {
#   name           = "terraform-lock"
#   read_capacity  = "5"
#   write_capacity = "5"
#   hash_key       = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
