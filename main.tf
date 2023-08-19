provider "aws" {}

module "vpc" {
  source = "./modules/vpc"
}