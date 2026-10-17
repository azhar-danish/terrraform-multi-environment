resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.env}-state_table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.dynamodb_hash_key

  attribute {
    name = var.dynamodb_hash_key
    type = "S"
  }

  tags = {
    Name        = "${var.env}-state_table"
    Environment = var.env
  }
}
