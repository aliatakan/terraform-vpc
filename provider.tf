provider "aws" {
 default_tags {
   tags = {
     Environment = "Test"
     Owner       = "TFProviders"
     Project     = "Test"
   }
 }
    region = var.AWS_REGION
}