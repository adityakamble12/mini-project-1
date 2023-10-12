
provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./vpc"
  region = "us-west-2"

  # vpc:
  vpc_cidr_block       = "10.0.0.0/16"
  vpc_instance_tenancy = "default"
  vpc_name             = "Terra-VPC"

  # pub_subnets:

  availability_zone_1 = "us-west-2a"
  pub_subnet1_cidr    = "10.0.1.0/24"
  pub_subnet1_name    = "Terra-pub1-Subnet"

  availability_zone_2 = "us-west-2b"
  pub_subnet2_cidr    = "10.0.3.0/24"
  pub_subnet2_name    = "Terra-pub2-Subnet"

  # priv_subnets:

  availability_zone_3 = "us-west-2a"
  priv_subnet1_cidr   = "10.0.2.0/24"
  priv_subnet1_name   = "Terra-priv1-Subnet"

  availability_zone_4 = "us-west-2b"
  priv_subnet2_cidr   = "10.0.4.0/24"
  priv_subnet2_name   = "Terra-priv2-Subnet"

  # pub_route_table:

  pub_route_table_name = "Terra-pub-route"


  # priv_route_table:

  priv_route_table_name = "Terra-priv-route"


  # public instance:

  pub_instance_ami      = "ami-03f65b8614a860c29"
  pub_instance_type     = "t2.micro"
  pub_instance_key_name = "my-ec2"
  pub_instance_name     = "Terra-pub-ec2"


  # private instance:

  priv_instance_ami      = "ami-03f65b8614a860c29"
  priv_instance_type     = "t2.micro"
  priv_instance_key_name = "my-ec2"
  priv_instance_name     = "Terra-priv-ec2"
}


#module "my_s3_bucket" {
#  source = "./s3-bucket"
#  region = "us-west-2"
#  bucket_name       = "haddikadacha"
#  acl               = "private"
#  enable_versioning = true
#  index_document    = "index.html"
#  error_document    = "error.html"
#}


module "my_cloudfront_s3" {
  source = "./cloudfront-s3"

  region                            = "us-west-2"
  cf_origin_access_identity_comment = "MyCustomComment"
  s3_bucket_name                    = "haddikadacha"
  cf_distribution_comment           = "CustomCloudFrontDistribution"
  cf_restriction_locations          = ["US", "CA"]
}


module "my_ecr" {
  source = "./ecr"

  region = "us-west-2"
  ecr    = "mini-project-1"
}
