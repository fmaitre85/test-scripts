REM Create .NET launch template
aws ec2 create-launch-template-version --launch-template-id lt-0c2f3c72ea229288d --version-description Web-03-10-2023 --launch-template-data file://config.json

REM Modify auto-scaling group
aws autoscaling update-auto-scaling-group --auto-scaling-group-name App-ASG --launch-template LaunchTemplateId=lt-0c2f3c72ea229288d,Version=$Latest --min-size 6 --max-size 12 --desired-capacity 6 --region us-east-1

ECHO wait for new instances to launch
TIMEOUT /T 300

REM Scale Down Instances
ECHO Scaling Down
aws autoscaling update-auto-scaling-group --auto-scaling-group-name App-ASG --launch-template LaunchTemplateId=lt-0c2f3c72ea229288d,Version=$Latest --min-size 3 --max-size 8 --desired-capacity 3 --region us-east-1


