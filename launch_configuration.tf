resource "aws_launch_configuration" "ecs_launch_config" {
    image_id             = "ami-09bee01cc997a78a6"
    # iam_instance_profile = aws_iam_instance_profile.ecs-instance-profile.name
    iam_instance_profile = aws_iam_instance_profile.ecs-instance-profile.name
    security_groups      = [aws_security_group.ecs_sg.id]
    user_data            = "#!/bin/bash\necho ECS_CLUSTER=my-cluster >> /etc/ecs/ecs.config"
    instance_type        = "t2.medium"
}