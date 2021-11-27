module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  subnets         = module.vpc.private_subnets
  enable_irsa     = true

  tags = {
    Environment = "test"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                 = "utilities-group"
      instance_type        = "t3.large"
      asg_desired_capacity = 2
    },
    {
      name                 = "applications-group"
      instance_type        = "t3.large"
      asg_desired_capacity = 2
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
