resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.project_name}-${var.environment}-bucket"

  tags = {
    Name = "${var.project_name}-${var.environment}-bucket"
  }
}
