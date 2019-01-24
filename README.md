[![Build Status](https://img.shields.io/travis/shinesolutions/aem-helloworld-config.svg)](http://travis-ci.org/shinesolutions/aem-helloworld-config)

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

### AEM AWS Stack Builder

The directories under `aem-aws-stack-builder` must be prefixed with either one of `aem-consolidated-, `aem-full-set-`, or `aem-stack-manager-`.

The prefix will then be used to identify the profiles drop down list on [AEM OpenCloud Manager](https://github.com/shinesolutions/aem-opencloud-manager) . Please note that this feature is not yet completed as AEM OpenCloud Manager is still being developed.
