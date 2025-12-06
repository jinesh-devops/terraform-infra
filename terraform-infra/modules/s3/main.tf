resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  
  tags = merge(var.tags, {
    "TerraformModule" = "s3"
  })
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }

  lifecycle {
    prevent_destroy = false
  }
}

