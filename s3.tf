resource "aws_s3_bucket" "equifax-test-s3" {
  bucket = "equifax-test-s3"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Prod"
  }

versioning {
    enabled = true
  }


object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
}

# resource "aws_s3_bucket_object" "object" {
#   bucket = "equifax-test-s3"
#   key    = "templates"
#   source = "${file("templates/web-server_data.tpl")}"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   etag = "${filemd5("templates/web-server_data.tpl")}"
# }