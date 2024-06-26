Repo: data-depot-02

# AWS VPC

## Description

There are several considerations to be made while building a VPC for any project. Let’s start to build our VPC from the ground up using Terraform.

- VPC in eu-west-2 zone
- Internet Gateway
- Public Subnets, one in each AZ
- Private Subnets, one in each AZ
- Route Table configurations (main and 2nd)

A VPC spans all the Availability Zones (AZ) in a region. It is always associated with a CIDR range (both IPv4 and IPv6) which defines the number of internal network addresses that may be used internally.

Within the VPC, we create subnets that are specific to AZs. It is possible to have multiple subnets in the same AZ. The purpose of subnets is to internally segregate resources contained in the VPC in every AZ. AWS Regions consist of multiple Availability Zones for DR purposes.

When a VPC is created, a corresponding Route Table is also created, which defines a default route that lets the components in the VPC communicate with each other internally. The route table thus created is called the main route table.

Our architecture contains two types of subnets – public and private. Public subnets enable internet access for the components hosted within them, while private subnets don’t. Routes in the route tables drive the decision to enable or disable internet access. When a subnet is associated with a route table that allows internet access, it is called a public subnet. Whereas the subnet associated with the route table that does not allow internet access is called private subnet.

An internet gateway is deployed and associated with the VPC to enable internet traffic within the VPC’s public subnets. Only one internet gateway can be associated with each VPC. Owing to this, and the fact that there is usually a default internet address (0.0.0.0/0) pointing to the internet gateway, as a best practice, it is recommended to create a second route table.

Thus apart from the main route table, our architecture consists of a second route table to which public subnets are explicitly associated. With this as the background, let us start building this VPC design from scratch.

```
terraform plan -out plan.out
```

```
terraform apply plan.out
```

```
Using the `.tfvars` file

terraform apply -var-file="prod.tfvars"

```


## License
Apache License v2.0
[See the Terms & Conditions of Apache License](https://www.apache.org/licenses/LICENSE-2.0)

# Authors

Joey Allen