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
- Added content-sync config for operational tasks pipeline
- Added CodeQL code scanning workflow and README badge

### Changed
- Bake AEM 6.5 AMIs with packer-aem profile aem65_sp26 (AEM 6.5 Service Pack 26)
- Enable the AEM Chaos Engine in the AEM Full-Set profiles in dry run, with author-dispatcher, publish and publish-dispatcher as targets, and turn off Chaos Monkey, which it replaces #AOC-I231
- Simplify GitHub Actions release workflows to not use custom action
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
- Updated jdk 8u371 and aem-profile aem65_sp16
- Lock shinesolutions/aem-platform-buildenv image to v3.2.0

### Removed
- Remove the Chaos Monkey settings from the AEM Full-Set profiles: `security_groups.chaos_monkey`, the instance type, volume size, random termination and termination settings, the Chaos Monkey security group tag in the sandpit network config, `chaos_monkey` from the README `ami_ids` example, the `chaos_monkey` AMI IDs and the `chaos_monkey` AMI ID the `test-aoc` Jenkinsfiles write. `chaos_monkey.include_stack: false` stays, because AEM AWS Stack Builder versions before 10.0.0 include Chaos Monkey by default: remove it once only 10.0.0 or later is used. packer-aem still generates a `chaos_monkey` AMI ID, so remove it again after an AMI ID update until packer-aem stops generating it #AOC-I231
- Removed `inbound_from_bastion_host_security_group` configuration since it's no longer needed in aem-aws-stack-builder 4.34.0
- Remove `java.version` and `java.version_update` from packer-aem java configuration.
