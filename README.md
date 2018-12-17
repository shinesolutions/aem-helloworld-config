[![Build Status](https://img.shields.io/travis/shinesolutions/aem-helloworld-config.svg)](http://travis-ci.org/shinesolutions/aem-helloworld-config)

AEM Hello World Config
----------------------

AEM Hello World Config is an example configuration for [Packer AEM](https://github.com/shinesolutions/packer-aem), [AEM AWS Stack Builder](https://github.com/shinesolutions/aem-aws-stack-builder), [AEM Stack Manager Messenger](https://github.com/shinesolutions/aem-stack-manager-messenger), and [AEM Test Suite](https://github.com/shinesolutions/aem-test-suite). These configuration files are consumed by those repos via `deps-test` or `deps-test-local` Makefile targets.

AEM Hello World Config is part of [AEM OpenCloud](https://aemopencloud.io) platform.

Usage
-----

To generate Packer AEM configurations:

    make gen-packer-aem-all

The configuration files will be generated at `packer-aem/<platform_type>-<os_type>-<aem_version>/` .

The permutation of Packer AEM configurations are generated from the source `packer-aem/src/` .
