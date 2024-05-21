output "s3_bucket_website_url" {
  value = aws_s3_bucket.static_website_bucket.website_endpoint
}
