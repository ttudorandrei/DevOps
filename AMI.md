# Amazon Machine Images

An Amazon Machine Images (AMI) provides the information required to launch an instance. You must specify an AMI when you launch an instance.

## Usage

- Helps us save the app status (like taking a snapshot in Vagrant).
- Helps automate deployment on cloud.
- What AMIs are already available on AWS? On a stopped EC2 instance, you can find the AMI ID in the `Details` tab, when you click on you instance.

## Benefits

- You can rely on pre-configured templates that allow you to deploy one or more instances.
- Provides the ability to quickly and efficiently determine what computing power, memory, storage and other factors you need for your applications.
- Low cost.
- Speeds up configuration and deployment because the templates are well-known and defined for typical computing infrastructure needs.
- Flexibility.

## How to create an AMI

- Choose the instance you want to create AMI for.
- Click on `Actions` at top-right corner.
- Choose `Image and Templates`.
- Choose `Create image`. This will prompt you with some details, add a name and description and that should be all.

## Create EC2 instance from AMI

- In you side-bar, under `Images` tab choose `AMIs`.
- Click on you AMI and choose `Launch instance from image` button.
- Go through the steps as usual BUT, on the `Security` tab, choose `existing rules` and look for the rules that already exist for the app.
- Launch instance and ssh into it using the new IP.
- All of your data should be there.
