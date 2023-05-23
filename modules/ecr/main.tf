resource "aws_ecr_repository" "frontend_ecr" {
  name = "${local.project_name}-${local.env}-frontend"
}

resource "aws_ecr_lifecycle_policy" "frontend_ecr_policy" {
  repository = aws_ecr_repository.frontend_ecr.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Removes all untagged images older than 3 versions",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}