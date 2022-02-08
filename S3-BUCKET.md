# Amazon S3 Bucket

![amazon s3 diagram](./public/assets/img/AWS-S3-diagram.png)

# Table of Contents

- [Amazon S3 Bucket](#amazon-s3-bucket)
- [Table of Contents](#table-of-contents)
  - [What is Amazon S3](#what-is-amazon-s3)
  - [Advantages](#advantages)
  - [Use Cases](#use-cases)
  - [S3 Storage Classes (WIP)](#s3-storage-classes-wip)
  - [Steps to Log into S3](#steps-to-log-into-s3)
  - [Perform CRUD Operations in AWS S3](#perform-crud-operations-in-aws-s3)

## What is Amazon S3

Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. Customers of all sizes and industries can use Amazon S3 to store and protect any amount of data for a range of use cases, such as data lakes, websites, mobile applications, backup and restore, archive, enterprise applications, IoT devices, and big data analytics. Amazon S3 provides management features so that you can optimize, organize, and configure access to your data to meet your specific business, organizational, and compliance requirements.

## Advantages

- Globally available.
- Can Store anything.
- Reliable Security.
- Low cost.
- Ease of Migration.
- Simplicity of Management.

## Use Cases

- Used for Disaster Recovery.
- We can perform the CRUD operations (Create, Read, Update, Delete).
- Analytics.
- Data Archiving.
- Static Website Hosting.
- Security and Compliance.

## S3 Storage Classes (WIP)

- Standard: Access data anytime.
- Glacier: infrequent data access.
- Check more [here](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html)

## Steps to Log into S3

- Run you instance.
- SSH into your instance.
- AWS CLI Dependencies: install pip3, python3.
- Use `sudo pip3 install awscli` to install AWSCLI.
- Run `aws configure`
- Input access id
- Input secret key
- Input region `eu-west-1`.
- Choose `json` as the preferred language.
- If everything is done correctly, if you type `aws s3 ls` we will get a list of files in the specified S3 bucket

## Perform CRUD Operations in AWS S3

- Create a bucket with ` aws s3 mb s3://<name of bucket>`. `mb` stands for "make bucket". S3 **DOES NOT ALLOW** underscores "\_"
- Add folder from ec2 instance to s3 bucket using `aws s3 cp <filename + extesnion> s3://<bucket name>`.
- List files inside specific bucket with `aws s3 ls s3://YOUR_BUCKET --recursive --human-readable --summarize`
- Download data from S3 bucket to ec2 instance with `aws s3 cp s3://<bucket name>/<filepath/filename> <destination path>`. Use `~` instead of destination path in case you want the file(s) downloaded at root folder.
- Delete **everything** inside the bucket `aws s3 rm s3://<bucket name> --recursive`
- Remove s3 `aws s3 rb s3://<bucket name>`
