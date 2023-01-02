# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased
### Added
- Added CodePipeline/CodeBuild configuration
- Added users ssh keys for aem-opencloud env
- Added aem-security pipeline stage in AOC End to End Testing RS-89
- Added Jenkinsfiles to run End2End Testsing of AEM OpenCloud RS-52
- Added packer-aem and stack-builder profiles for AOC End to End Testing.
- Added `vulnerable_paths.txt` in aem-test-suite configuration to test AEM endpoints.

### Changed
- Updated parameters for new sandpit AWS account
- Update Jumphost access security group (from jumphost inbound to instances) with the resource `shn-awsres-03`
- Updated AMI IDs for the aem65_sp3-rhel7-jdk8
- Updated `aem65_sp13` to `aem65_sp14` for aem-65 profile in packer-aem
- Updated `certificate_arn` and `certificate_key_arn` for jdk8 in packer-aem
- Updated `certificate_arn` for stack-builder configuration
- Updated gen-aem-aws-stack-builder to add encryption file to aem-stack-manager profile
- Updated descriptor artifacts versions.
- Change author-dispatcher ELB inbound to allow reverse proxy CIDR
- Change publish-dispatcher ELB inbound to allow the Internet since it's on public subnet
- Updated configuration for aem-test-suite
- Renamed packer-aem profiles

### Removed
- Removed `inbound_from_bastion_host_security_group` configuration since it's no longer needed in aem-aws-stack-builder 4.34.0
- Remove `java.version` and `java.version_update` from packer-aem java configuration.
