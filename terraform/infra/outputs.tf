output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "eks_node_group_name" {
  value = aws_eks_node_group.example_nodes.node_group_name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app_repo.repository_url
}
