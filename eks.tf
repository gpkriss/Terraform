resource "aws_eks_cluster" "Dev_eks" {
  name     = "dev_eks"
  role_arn = aws_iam_role.dev_eks_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.Dev_Pvt_subnet.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.dev_eks_role-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.dev_eks_role-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.Dev_eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.Dev_eks.certificate_authority[0].data
}