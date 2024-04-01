# Terraform-AWS

Use HCL to write all the required files.(network.tf, ec2.tf, provider.tf, sshkey.tf)

### Network.tf 

This file is required to define VPC, subnets, internet gateway and security groups for the AWS environment.

### sshkey.tf

Created to manage the SSH key pair used for accessing the EC2 instances created by Terraform.

### ec2.tf

This file holds the Terraform resource blocks for creating EC2 instances, instance types, AMI ID, security groups, etc.

### provider.tf

In our case this is only used for providing the AWS Region.

# Automating using Jenkins

Install Jenkins and configure, then provide the AWS Credentials. Run the pipeline.  

The screen when all the steps run successfully:
![Screenshot from 2024-04-01 12-43-34](https://github.com/SharanReddyy/Terraform-AWS-Jenkins/assets/78129496/cf374fa2-7963-4c12-80c9-e750d82fe828)

Nginx screen available all over the internet:
![Screenshot from 2024-04-01 15-03-37](https://github.com/SharanReddyy/Terraform-AWS-Jenkins/assets/78129496/682ff5b1-8c3a-4d38-9f41-fc35ff45bf82)

