resource "aws_ecs_task_definition" "task_definition" {
  family                   = "worker"
  container_definitions    = "${data.template_file.task_definition_json.rendered}"
  memory                   = "1024"
  cpu                      = "512"
  requires_compatibilities = ["EC2"]
}

data "template_file" "task_definition_json" {
  template = "${file("${path.module}/task_definition.json")}"
}
