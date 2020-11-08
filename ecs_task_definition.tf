resource "aws_ecs_task_definition" "task_definition" {
  family                   = "worker"
  container_definitions    = "${data.template_file.task_definition_json.rendered}"
  requires_compatibilities = ["EC2"]
  cpu = "512"
  memory = "1024"
  task_role_arn = aws_iam_role.ecs-task-execution-role.arn
  execution_role_arn  = aws_iam_role.ecs-task-execution-role.arn
  # depends_on = [aws_cloudwatch_log_group.jenkins_log_group, aws_iam_role.ecs-task-execution-role]
}

data "template_file" "task_definition_json" {
  template = "${file("${path.module}/task_definition.json")}"
}
