resource "aws_iam_role" "cd4ml_eks_cluster" {
  name = "cd4ml_eks_cluster-${lower(var.cd4ml_env)}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "EKS-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cd4ml_eks_cluster.name
}

resource "aws_iam_role_policy_attachment" "EKS-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cd4ml_eks_cluster.name
}

resource "aws_iam_role_policy_attachment" "EKS-cluster-AmazonRoute53FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  role       = aws_iam_role.cd4ml_eks_cluster.name
}

resource "aws_iam_role" "cd4ml_eks_nodes" {
  name = "cd4ml_eks_nodes-${lower(var.cd4ml_env)}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "EKS-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.cd4ml_eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "EKS-node-AmazonS3FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.cd4ml_eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "EKS-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.cd4ml_eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "EKS-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.cd4ml_eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "EKS-node-AmazonRoute53FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  role       = aws_iam_role.cd4ml_eks_nodes.name
}

