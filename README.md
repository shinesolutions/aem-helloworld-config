[![Build Status](https://github.com/shinesolutions/aem-helloworld-config/workflows/CI/badge.svg)](https://github.com/shinesolutions/aem-helloworld-config/actions?query=workflow%3ACI)

AEM Hello World Config
----------------------

AEM Hello World Config is an example configuration for [Packer AEM](https://github.com/shinesolutions/packer-aem), [AEM AWS Stack Builder](https://github.com/shinesolutions/aem-aws-stack-builder), [AEM Stack Manager Messenger](https://github.com/shinesolutions/aem-stack-manager-messenger), and [AEM Test Suite](https://github.com/shinesolutions/aem-test-suite). These configuration files are consumed by those repos via `deps-test` or `deps-test-local` Makefile targets.

AEM Hello World Config is part of [AEM OpenCloud](https://aemopencloud.io) platform.

Usage
-----

To generate Packer AEM configurations:

    make gen-packer-aem

The configuration files will be generated at `packer-aem/<platform_type>-<os_type>-<aem_version>/` .

The permutation of Packer AEM configurations are generated from the source `packer-aem/src/` .

To generate AEM AWS Stack Builder configurations:

    make gen-aem-aws-stack-builder

The configuration files will be generated at `aem-aws-stack-builder/<os_type>-<aem_version>/` .

The permutation of AEM AWS Stack Builder configurations are generated from the source `aem-aws-stack-builder/src/` .

To update the AMI IDs with the latest AMIs:

    make gen-aem-aws-stack-builder-ami-ids

This will update the `aem-aws-stack-builder/src/apps/aem/*-stack-builder-ami-ids.yaml` files with the latest AMI IDs for the configured OSes and AEM versions.

Local configuration
-------------------

If you want to specify a local configuration that wouldn't be pushed to origin, you can create a file named `zzz-local.yaml` and place it on any configuration path. Some use cases for local configuration is for creating an AEM environment with your own EC2 keypair, or for creating an AEM environment with your own AMI IDs.

For example, if you want to create an AEM consolidated environment with RHEL7 and AEM 6.4 and you want to be able to SSH into the EC2 instances. Create the file `aem-aws-stack-builder/aem-consolidated-rhel7-aem64/zzz-local.yaml` with content:

    ---
    compute:
      key_pair_name: <your_ec2_keypair>

If you want to use your own AMI IDs:

    ---
    ami_ids:
      author: <your_author_ami_id>
      author_dispatcher: <your_author_dispatcher_ami_id>
      author_publish_dispatcher: <your_author_publish_dispatcher_ami_id>
      chaos_monkey: <your_chaos_monkey_ami_id>
      orchestrator: <your_orchestrator_ami_id>
      publish: <your_publish_ami_id>
      publish_dispatcher: <your_publish_dispatcher_ami_id>

Naming convention
-----------------

| Directory | Description |
|-----------|-------------|
| `packer-aem/` | Contains [Packer AEM configurations](https://github.com/shinesolutions/packer-aem/blob/master/docs/configuration.md). [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/packer-aem/src) |
| `packer-aem/src/` | Contains common Packer AEM YAML configuration files. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/packer-aem/src) |
| `packer-aem/aws-resources-<profile>/` | Contains YAML configuration files for a given Packer AEM AWS resources profile. The directory should be named with `aws-resources-` prefix, e.g. `aws-resources-sandpit`. This directory should contain files copied from `packer-aem/src/` which are relevant for AWS resources profile. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/packer-aem/aws-resources-sandpit) |
| `packer-aem/<platform_type>-<profile>/` | Contains YAML configuration files for a given Packer AEM profile for platform type (e.g. `aws`). The directory should be named with `aws-` prefix, e.g. `aws-rhel7-aem64`, `aws-amazon-linux2-aem64`. This directory should contain files copied from `packer-aem/src/` which are relevant for the profile. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/packer-aem/aws-rhel7-aem64) |
| `aem-aws-stack-builder/` | Contains [AEM AWS Stack Builder configurations](https://github.com/shinesolutions/aem-aws-stack-builder/blob/master/docs/configuration.md). [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-aws-stack-builder) |
| `aem-aws-stack-builder/src/` | Contains common AEM AWS Stack Builder configuration files. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-aws-stack-builder/src) |
| `aem-aws-stack-builder/aem-full-set-<profile>/` | Contains YAML configuration files for a given AEM Full-Set profile. The directory should be named with `aem-full-set-` prefix, e.g. `aem-full-set-rhel7-aem64-dev`, `aem-full-set-amazon-linux2-aem64-prod`. This directory should contain files copied from `aem-aws-stack-builder/src/` which are relevant for the profile. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-aws-stack-builder/aem-full-set-rhel7-aem64) |
| `aem-aws-stack-builder/aem-consolidated-<profile>/` | Contains YAML configuration files for a given AEM Consolidated profile. The directory should be named with `aem-consolidated-` prefix, e.g. `aem-consolidated-rhel7-aem64-dev`, `aem-consolidated-amazon-linux2-aem64-prod`. This directory should contain files copied from `aem-aws-stack-builder/src/` which are relevant for the profile. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-aws-stack-builder/aem-consolidated-rhel7-aem64) |
| `aem-aws-stack-builder/aem-stack-manager-<profile>/` | Contains YAML configuration files for a given AEM Stack Manager profile. The directory should be named with `aem-stack-manager-` prefix, e.g. `aem-stack-manager-dev`, `aem-stack-manager-prod`. This directory should contain files copied from `aem-aws-stack-builder/src/` which are relevant for the profile. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-aws-stack-builder/aem-stack-manager-sandpit) |
| `aem-stack-manager-messenger/` | Contains [AEM Stack Manager Messenger configurations](https://github.com/shinesolutions/aem-stack-manager-messenger/blob/master/docs/configuration.md). [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-stack-manager-messenger) |
| `aem-stack-manager-messenger/<profile>` | Contains YAML configuration files for a given AEM Stack Manager profile. A profile could be named anything descriptive, e.g. `sandpit`, `prod`. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-stack-manager-messenger/sandpit) |
| `aem-test-suite/` | Contains [AEM Test Suite configurations](https://github.com/shinesolutions/aem-test-suite/blob/master/docs/configuration.md). [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-test-suite) |
| `aem-test-suite/<profile>` | Contains YAML configuration files for a given AEM Test Suite profile. A profile could be named anything descriptive, e.g. `sandpit`, `dev`, `test`, `prod`. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-test-suite/sandpit) |
| `aem-opencloud-manager/` | Contains [AEM OpenCloud Manager configurations](https://github.com/shinesolutions/aem-opencloud-manager/blob/master/docs/configuration.md). [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-opencloud-manager/) |
| `aem-opencloud-manager/<profile>` | Contains YAML configuration files for a given AEM OpenCloud Manager profile. A profile could be named anything descriptive, e.g. `sandpit`, `dev`, `test`, `prod`. [Example](https://github.com/shinesolutions/aem-helloworld-config/tree/master/aem-opencloud-manager/sandpit) |

The directories under `aem-aws-stack-builder` must be prefixed with either one of `aem-consolidated-`, `aem-full-set-`, or `aem-stack-manager-`.

The prefix will then be used to identify the profiles drop down list on [AEM OpenCloud Manager](https://github.com/shinesolutions/aem-opencloud-manager) . Please note that this feature is not yet completed as AEM OpenCloud Manager is still being developed.
