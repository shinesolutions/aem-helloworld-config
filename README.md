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

Naming Convention
-----------------

### AEM AWS Stack Builder

The directories under `aem-aws-stack-builder` must be prefixed with either one of `aem-consolidated-, `aem-full-set-`, or `aem-stack-manager-`.

The prefix will then be used to identify the profiles drop down list on [AEM OpenCloud Manager](https://github.com/shinesolutions/aem-opencloud-manager) . Please note that this feature is not yet completed as AEM OpenCloud Manager is still being developed.
