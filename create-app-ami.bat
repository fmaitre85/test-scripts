REM Create AMI for App-Stage ASG
aws ec2 create-image --region us-east-1 --instance-id i-00f8798e9207a3102 --name "Web-%date:~4,2%%date:~7,2%%date:~10,4%" --no-reboot --output json