# Packer AEM is used to retrieve the IDs of the latest AMIs created by Packer AEM itself
packer_aem_version=5.9.0

ci: clean deps gen-packer-aem gen-aem-aws-stack-builder lint

clean:
	rm -rf stage/

stage:
	mkdir -p stage/

deps: stage
	pip3 install -r requirements.txt
	mkdir -p stage/packer-aem/
	curl -L -o "stage/packer-aem/packer-aem-${packer_aem_version}.tar.gz" "https://github.com/shinesolutions/packer-aem/releases/download/${packer_aem_version}/packer-aem-${packer_aem_version}.tar.gz"
	cd stage/packer-aem && tar -xvzf "packer-aem-${packer_aem_version}.tar.gz" && make deps

lint:
	yamllint \
	  aem-opencloud-manager/*/*.yaml \
	  aem-test-suite/*/*.yaml \
	  packer-aem/*/*.yaml \
	  aem-aws-stack-builder/*/*.yaml \
	  aem-aws-stack-builder/*/*/*.yaml \
	  aem-aws-stack-builder/*/*/*/*.yaml

	for file in descriptors/*/*; do \
	  echo "Validating JSON file: $$file"; \
	  jq "." <<< echo "$$file" || exit 1; \
	done

################################################################################
# Packer AEM configuration generator targets.
################################################################################

gen-packer-aem:
	$(call gen_packer_aem,aws,rhel7,aem64,jdk8)
	$(call gen_packer_aem,aws,rhel7,aem65,jdk8)
	$(call gen_packer_aem_aoc_testing_profiles,aws,rhel7,aem65,jdk8,nb)
	$(call gen_packer_aem,aws,rhel7,aem65,jdk11)
	$(call gen_packer_aem_aoc_testing_profiles,aws,rhel7,aem65,jdk11,ap)
	$(call gen_packer_aem_aoc_testing_profiles,aws,rhel7,aem65,jdk11,sh)
	$(call gen_packer_aem,aws,rhel8,aem64,jdk8)
	$(call gen_packer_aem,aws,rhel8,aem65,jdk8)
	$(call gen_packer_aem,aws,rhel8,aem65,jdk11)
	$(call gen_packer_aem_experimental,aws,centos7,aem64,jdk8,experimental)
	$(call gen_packer_aem_experimental,aws,centos7,aem65,jdk8,experimental)
	$(call gen_packer_aem_experimental,aws,centos7,aem65,jdk11,experimental)
	$(call gen_packer_aem,aws,amazon-linux2,aem64,jdk8)
	$(call gen_packer_aem,aws,amazon-linux2,aem64,jdk8,cb)
	$(call gen_packer_aem,aws,amazon-linux2,aem65,jdk8)
	$(call gen_packer_aem,aws,amazon-linux2,aem65,jdk11)
	$(call gen_packer_aem_aoc_testing_profiles,aws,amazon-linux2,aem65,jdk11,sh)
	$(call gen_packer_aem_experimental,docker,centos7,aem64,jdk8,experimental)
	$(call gen_packer_aem_experimental,docker,centos7,aem65,jdk8,experimental)
	$(call gen_packer_aem_experimental,docker,centos7,aem65,jdk11,experimental)
	$(call gen_packer_aem_experimental,docker,amazon-linux2,aem64,jdk8,experimental)
	$(call gen_packer_aem_experimental,docker,amazon-linux2,aem65,jdk8,experimental)
	$(call gen_packer_aem_experimental,docker,amazon-linux2,aem65,jdk11,experimental)
	$(call gen_packer_aem_aws_resources,sandpit)

define gen_packer_aem
  rm -rf packer-aem/$(1)-$(2)-$(3)-$(4)
	mkdir -p packer-aem/$(1)-$(2)-$(3)-$(4)
	cp packer-aem/src/sandpit.yaml packer-aem/$(1)-$(2)-$(3)-$(4)/
	cp packer-aem/src/encryption.yaml packer-aem/$(1)-$(2)-$(3)-$(4)/
	cp packer-aem/src/platform-$(1).yaml packer-aem/$(1)-$(2)-$(3)-$(4)/
	cp packer-aem/src/os-$(2).yaml packer-aem/$(1)-$(2)-$(3)-$(4)/
	cp packer-aem/src/$(3).yaml packer-aem/$(1)-$(2)-$(3)-$(4)/
	cp packer-aem/src/$(4).yaml packer-aem/$(1)-$(2)-$(3)-$(4)/
endef

define gen_packer_aem_aoc_testing_profiles
  rm -rf packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)
	mkdir -p packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)
	cp packer-aem/src/sandpit.yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/encryption.yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/platform-$(1).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/os-$(2).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/$(3).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/$(4).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
endef

define gen_packer_aem_experimental
  rm -rf packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)
	mkdir -p packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)
	cp packer-aem/src/sandpit.yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/encryption.yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/platform-$(1).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/os-$(2).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/$(3).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
	cp packer-aem/src/$(4).yaml packer-aem/$(1)-$(2)-$(3)-$(4)-$(5)/
endef

define gen_packer_aem_aws_resources
  rm -rf packer-aem/aws-resources-$(1)
	mkdir -p packer-aem/aws-resources-$(1)
	cp packer-aem/src/aws-resources.yaml packer-aem/aws-resources-$(1)/
endef

################################################################################
# AEM AWS Stack Builder configuration generator targets.
################################################################################

gen-aem-aws-stack-builder:
	$(call gen_aem_aws_stack_builder,aem64,rhel7,full-set,lightweight,jdk8)
	$(call gen_aem_aws_stack_builder,aem64,rhel7,consolidated,lightweight,jdk8)
	$(call gen_aem_aws_stack_builder,aem64,amazon-linux2,full-set,lightweight,jdk8)
	$(call gen_aem_aws_stack_builder,aem64,amazon-linux2,full-set,lightweight,jdk8,cb)
	$(call gen_aem_aws_stack_builder,aem64,amazon-linux2,consolidated,lightweight,jdk8)
	$(call gen_aem_aws_stack_builder,aem64,amazon-linux2,consolidated,lightweight,jdk8,cb)
	# AEM 6.5 RHEL7 FS Heavyweight JDK8
	$(call gen_aem_aws_stack_builder,aem65,rhel7,full-set,heavyweight,jdk8)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,rhel7,full-set,heavyweight,jdk8,nb)
	$(call gen_aem_aws_stack_builder_preview,aem65,rhel7,full-set,heavyweight,jdk8)
	$(call gen_aem_aws_stack_builder_preview_testing_profile,aem65,rhel7,full-set,heavyweight,jdk8,sh)
	$(call gen_aem_aws_stack_builder_preview_testing_profile,aem65,rhel7,full-set,heavyweight,jdk8,nb)
	# AEM 6.5 RHEL7 FS Heavyweight JDK11
	$(call gen_aem_aws_stack_builder,aem65,rhel7,full-set,heavyweight,jdk11)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,rhel7,full-set,heavyweight,jdk11,ap)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,rhel7,full-set,heavyweight,jdk11,sh)
	$(call gen_aem_aws_stack_builder_preview_testing_profile,aem65,rhel7,full-set,heavyweight,jdk11,sh)
	$(call gen_aem_aws_stack_builder_preview,aem65,rhel7,full-set,heavyweight,jdk11)
	# AEM 6.5 RHEL7 Consolidated Heavyweight JDK8
	$(call gen_aem_aws_stack_builder,aem65,rhel7,consolidated,heavyweight,jdk8)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,rhel7,consolidated,heavyweight,jdk8,nb)
	# AEM 6.5 RHEL7 Consolidated Heavyweight JDK11
	$(call gen_aem_aws_stack_builder,aem65,rhel7,consolidated,heavyweight,jdk11)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,rhel7,consolidated,heavyweight,jdk11,ap)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,rhel7,consolidated,heavyweight,jdk11,sh)
	$(call gen_aem_aws_stack_builder_aoc_testing_saml_profile,aem65,rhel7,consolidated,heavyweight,jdk11,sh)
	# AEM 6.5 AL2 FS Ligthweight JDK8
	$(call gen_aem_aws_stack_builder,aem65,amazon-linux2,full-set,lightweight,jdk8)
	$(call gen_aem_aws_stack_builder_preview,aem65,amazon-linux2,full-set,lightweight,jdk8)
	# AEM 6.5 AL2 FS Ligthweight JDK11
	$(call gen_aem_aws_stack_builder,aem65,amazon-linux2,full-set,lightweight,jdk11)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,amazon-linux2,full-set,lightweight,jdk11,sh)
	$(call gen_aem_aws_stack_builder_preview,aem65,amazon-linux2,full-set,lightweight,jdk11)
	# AEM 6.5 AL2 Consolidated Ligthweight JDK8
	$(call gen_aem_aws_stack_builder,aem65,amazon-linux2,consolidated,lightweight,jdk8)
	# AEM 6.5 AL2 Consolidated Ligthweight JDK11
	$(call gen_aem_aws_stack_builder,aem65,amazon-linux2,consolidated,lightweight,jdk11)
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,aem65,amazon-linux2,consolidated,lightweight,jdk11,sh)
	# AEM Stack Manager
	$(call gen_aem_aws_stack_builder_aem_stack_manager,sandpit)
	# AEM CDN
	$(call gen_aem_aws_stack_builder_cdn,sandpit)
	# AEM Ressources
	$(call gen_aem_aws_stack_builder_aws_resources,sandpit)

define gen_aem_aws_stack_builder
	rm -rf aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	mkdir -p aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/common/*.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/$(1).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/ssh_keys.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/ZZZ_encryption.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/os-$(2).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/$(1)*-$(2)-$(5)-stack-builder-ami-ids.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/$(3).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/$(3)-$(4).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/$(5).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)/
endef

define gen_aem_aws_stack_builder_preview
	$(call gen_aem_aws_stack_builder,$(1),$(2),$(3)-preview,$(4),$(5))
	cp aem-aws-stack-builder/src/apps/aem/$(3)-$(4).yaml aem-aws-stack-builder/aem-$(3)-preview-$(2)-$(1)-$(5)/
	cp aem-aws-stack-builder/src/apps/aem/$(3).yaml aem-aws-stack-builder/aem-$(3)-preview-$(2)-$(1)-$(5)/
endef

define gen_aem_aws_stack_builder_preview_testing_profile
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,$(1),$(2),$(3)-preview,$(4),$(5),$(6))
	cp aem-aws-stack-builder/src/apps/aem/$(3)-$(4).yaml aem-aws-stack-builder/aem-$(3)-preview-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/$(3).yaml aem-aws-stack-builder/aem-$(3)-preview-$(2)-$(1)-$(5)-$(6)/
endef

define gen_aem_aws_stack_builder_aoc_testing_saml_profile
	$(call gen_aem_aws_stack_builder_aoc_testing_profile,$(1),$(2),$(3),$(4),$(5),$(6)-saml)
  cp aem-aws-stack-builder/src/apps/aem/saml.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)-saml/
endef

define gen_aem_aws_stack_builder_aoc_testing_profile
  rm -rf aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	mkdir -p aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/common/*.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/$(1).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/ssh_keys.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/ZZZ_encryption.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/os-$(2).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/$(1)*-$(2)-$(5)-stack-builder-ami-ids.yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/$(3).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/$(3)-$(4).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
	cp aem-aws-stack-builder/src/apps/aem/$(5).yaml aem-aws-stack-builder/aem-$(3)-$(2)-$(1)-$(5)-$(6)/
endef

define gen_aem_aws_stack_builder_aem_stack_manager
  rm -rf aem-aws-stack-builder/aem-stack-manager-$(1)/
	mkdir -p aem-aws-stack-builder/aem-stack-manager-$(1)/
	cp aem-aws-stack-builder/src/apps/aem-stack-manager.yaml aem-aws-stack-builder/aem-stack-manager-$(1)/
	cp aem-aws-stack-builder/src/apps/aem/ZZZ_encryption.yaml aem-aws-stack-builder/aem-stack-manager-$(1)/
	cp aem-aws-stack-builder/src/common/*.yaml aem-aws-stack-builder/aem-stack-manager-$(1)/
endef

define gen_aem_aws_stack_builder_cdn
	rm -rf aem-aws-stack-builder/cdn-$(1)/
	mkdir -p aem-aws-stack-builder/cdn-$(1)/
	cp aem-aws-stack-builder/src/apps/cdn.yaml aem-aws-stack-builder/cdn-$(1)/
	cp aem-aws-stack-builder/src/common/*.yaml aem-aws-stack-builder/cdn-$(1)/
endef

define gen_aem_aws_stack_builder_aws_resources
  rm -rf aem-aws-stack-builder/aws-resources-$(1)
	mkdir -p aem-aws-stack-builder/aws-resources-$(1)
	cp aem-aws-stack-builder/src/aws-resources.yaml aem-aws-stack-builder/aws-resources-$(1)/
	cp aem-aws-stack-builder/src/apps/aem/ZZZ_encryption.yaml aem-aws-stack-builder/aws-resources-$(1)/
endef

################################################################################
# Utility targets.
################################################################################

gen-aem-aws-stack-builder-ami-ids: stage
	rm -f aem-aws-stack-builder/src/apps/aem/*-stack-builder-ami-ids.yaml
	$(call gen_aem_aws_stack_builder_ami_ids,aws,rhel7,aem64,jdk8)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,rhel7,aem65,jdk8)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,rhel7,aem65,jdk11)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,centos7,aem64,jdk8)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,centos7,aem65,jdk8)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,centos7,aem65,jdk11)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,amazon-linux2,aem64,jdk8)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,amazon-linux2,aem65,jdk8)
	$(call gen_aem_aws_stack_builder_ami_ids,aws,amazon-linux2,aem65,jdk11)
	make gen-aem-aws-stack-builder

define gen_aem_aws_stack_builder_ami_ids
	cd stage/packer-aem/ && version="*" make clean ami-ids config_path=../../packer-aem/$(1)-$(2)-$(3)-$(4)/
	cp stage/packer-aem/stage/stack-builder-configs/*.yaml aem-aws-stack-builder/src/apps/aem/
endef

.PHONY: ci clean stage deps lint gen-packer-aem gen-aem-aws-stack-builder gen-aem-aws-stack-builder-ami-ids
