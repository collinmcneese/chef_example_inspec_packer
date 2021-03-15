# example_inspec_packer

Repository showing simple use case for using Packer to build an image with Chef Infra Client cookbook provisioning and Chef Inspec testing.

```plain
├── cookbooks
│   └── packer_build_nginx
├── templates
│   └── ubuntu_20-04_nginx.pkr.hcl
└── test
    └── packer_check_nginx
```

## Usage

Build an image from this repository with Packer:

`packer build templates`

## Packer Templates

Packer template files are located under the `templates` directory within this repository.  These files assume usage of AWS for building an AMI image and expect input of an `AWS_PROFILE` variable for authentication.

Example build passing the `AWS_PROFILE` attribute inline:

`PKR_VAR_AWS_PROFILE='some-profile-name' packer build templates`

## Cookbooks

The Packer template files in this repository use Chef Infra Client cookbooks for configuration provisioning of the images.  Cookbooks which are used by this build are referenced in `provisioner` configurations within template files and are stored locally under the `cookbooks` directory in this repository.

## Inspec Tests

The Packer template files in this repository use Chef Inspec profiles for validation images before creation.  Profiles which are used by this build are referenced in `provisioner` configurations within template files and are stored locally under the `test` directory in this repository.
