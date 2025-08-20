output "instance_id" {
  description = "ID of the saurabh's EC2 instance"
  value = aws_instance.my_ec2.id
}

output "bucket_arn" {
  description = "get you the bucket ARN"
  value = aws_s3_bucket.my_bucket.arn
}

output "s3_bucket_name" {
  description = "the name of saurabh's s3 bucket"
  value = aws_s3_bucket.my_bucket.bucket
}