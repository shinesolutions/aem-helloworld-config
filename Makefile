# Packer AEM is used to retrieve the IDs of the latest AMIs created by Packer AEM itself
packer_aem_version=3.4.2

ci: clean deps gen-packer-aem-all lint

clean:
	rm -rf stage

stage:
	mkdir -p stage

deps: stage
	pip install -r requirements.txt
	curl -L -o "stage/packer-aem/packer-aem-${packer_aem_version}.tar.gz" "https://github.com/shinesolutions/packer-aem/releases/download/${packer_aem_version}/packer-aem-${packer_aem_version}.tar.gz"
	mkdir -p stage/packer-aem && cd stage/packer-aem && tar -xvzf "packer-aem-${packer_aem_version}.tar.gz"

lint:
	yamllint packer-aem/*/*.yaml

################################################################################
# Packer AEM configuration generator targets.
################################################################################

gen-packer-aem:
	$(call gen_packer_aem,aws,rhel7,aem62)
	$(call gen_packer_aem,aws,rhel7,aem63)
	$(call gen_packer_aem,aws,rhel7,aem64)
	$(call gen_packer_aem,aws,centos7,aem62)
	$(call gen_packer_aem,aws,centos7,aem63)
	$(call gen_packer_aem,aws,centos7,aem64)
	$(call gen_packer_aem,aws,amazon-linux2,aem62)
	$(call gen_packer_aem,aws,amazon-linux2,aem63)
	$(call gen_packer_aem,aws,amazon-linux2,aem64)
	$(call gen_packer_aem,docker,centos7,aem62)
	$(call gen_packer_aem,docker,centos7,aem63)

define gen_packer_aem
  rm -rf packer-aem/$(1)-$(2)-$(3)
	mkdir -p packer-aem/$(1)-$(2)-$(3)
	cp packer-aem/src/sandpit.yaml packer-aem/$(1)-$(2)-$(3)/
	cp packer-aem/src/platform-$(1).yaml packer-aem/$(1)-$(2)-$(3)/
	cp packer-aem/src/os-$(2).yaml packer-aem/$(1)-$(2)-$(3)/
	cp packer-aem/src/$(3).yaml packer-aem/$(1)-$(2)-$(3)/
endef

################################################################################
# AEM AWS Stack Builder configuration generator targets.
################################################################################

gen-aem-aws-stack-builder:
	$(call gen_aem_aws_stack_builder,aem62,rhel7,full-set)
	$(call gen_aem_aws_stack_builder,aem62,rhel7,consolidated)
	$(call gen_aem_aws_stack_builder,aem62,amazon-linux2,consolidated)
	$(call gen_aem_aws_stack_builder,aem63,rhel7,full-set)
	$(call gen_aem_aws_stack_builder,aem63,rhel7,consolidated)
	$(call gen_aem_aws_stack_builder,aem64,rhel7,full-set)
	$(call gen_aem_aws_stack_builder,aem64,rhel7,consolidated)
	$(call gen_aem_aws_stack_builder_aem_stack_manager)

define gen_aem_aws_stack_builder
  rm -rf aem-aws-stack-builder/$(1)-$(2)-$(3)/
	mkdir -p aem-aws-stack-builder/$(1)-$(2)-$(3)/
	cp aem-aws-stack-builder/src/common/*.yaml aem-aws-stack-builder/$(1)-$(2)-$(3)/
	cp aem-aws-stack-builder/src/apps/aem/$(1).yaml aem-aws-stack-builder/$(1)-$(2)-$(3)/
	cp aem-aws-stack-builder/src/apps/aem/os-$(2).yaml aem-aws-stack-builder/$(1)-$(2)-$(3)/
	cp aem-aws-stack-builder/src/apps/aem/$(1)*-$(2)-stack-builder-ami-ids.yaml aem-aws-stack-builder/$(1)-$(2)-$(3)/
	cp aem-aws-stack-builder/src/apps/aem/$(3).yaml aem-aws-stack-builder/$(1)-$(2)-$(3)/
endef

define gen_aem_aws_stack_builder_aem_stack_manager
	mkdir -p aem-aws-stack-builder/aem-stack-manager/
	cp aem-aws-stack-builder/src/apps/aem-stack-manager.yaml aem-aws-stack-builder/aem-stack-manager/
	cp aem-aws-stack-builder/src/common/*.yaml aem-aws-stack-builder/aem-stack-manager/
endef

################################################################################
# Utility targets.
################################################################################

gen-aem-aws-stack-builder-ami-ids:
	rm -f aem-aws-stack-builder/src/apps/aem/*-stack-builder-ami-ids.yaml
	$(call gen_aem_aws_stack_builder_ami_ids,aws,rhel7,aem62)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,rhel7,aem63)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,rhel7,aem64)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,centos7,aem62)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,centos7,aem63)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,centos7,aem64)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,amazon-linux2,aem62)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,amazon-linux2,aem63)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,amazon-linux2,aem64)

define gen_aem_aws_stack_builder_ami_ids
	cd stage/packer-aem/ && make clean ami-ids config_path=../../packer-aem/$(1)-$(2)-$(3)/
	cp stage/packer-aem/stage/stack-builder-configs/*.yaml aem-aws-stack-builder/src/apps/aem/
endef

.PHONY: ci clean stage deps lint gen-packer-aem gen-aem-aws-stack-builder gen-aem-aws-stack-builder-ami-ids
