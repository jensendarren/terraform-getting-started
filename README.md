# Getting started with Terraform

Following along with the [Terraform Getting Started Guide](https://www.terraform.io/intro/getting-started/install.html)

## Running Terraform in a local Docker container

If you want to get up and running with Terraform on your local machine without having to install Terraform then try using it via a Docker Container.

The command to init the Terraform project is:

`docker run -i -t --rm -v $(pwd):/tf -v ~/.aws/:/root/.aws/ -w /tf hashicorp/terraform:light init`

To save yourself from typing out that long `docker run` command each time you can add an alias to your `~/.bash_profile` file like so:

`tf() { docker run -i -t --rm -v $(pwd):/tf -v ~/.aws/:/root/.aws/ -w /tf hashicorp/terraform:light "$1"; }`

Then run source to update your local terminal session to make that alias available to you:

`source ~/.bash_profile`

Now you can run Terraform from the command line like so:

```
tf init
tf plan
etc...
```