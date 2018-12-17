init:
	echo "TODO..."

################################################################################
# Packer AEM configuration generator targets.
################################################################################

gen-packer-aem-all: gen-packer-aem-aws-rhel7-aem62 gen-packer-aem-aws-rhel7-aem63 gen-packer-aem-aws-rhel7-aem64 gen-packer-aem-aws-centos7-aem62 gen-packer-aem-aws-centos7-aem63 gen-packer-aem-aws-centos7-aem64 gen-packer-aem-aws-amazon-linux2-aem62 gen-packer-aem-aws-amazon-linux2-aem63 gen-packer-aem-aws-amazon-linux2-aem64 gen-packer-aem-docker-centos7-aem62 gen-packer-aem-docker-centos7-aem63

gen-packer-aem-aws-rhel7-aem62: init
	$(call gen_packer_aem,aws,rhel7,aem62)

gen-packer-aem-aws-rhel7-aem63: init
	$(call gen_packer_aem,aws,rhel7,aem63)

gen-packer-aem-aws-rhel7-aem64: init
	$(call gen_packer_aem,aws,rhel7,aem64)

gen-packer-aem-aws-centos7-aem62: init
	$(call gen_packer_aem,aws,centos7,aem62)

gen-packer-aem-aws-centos7-aem63: init
	$(call gen_packer_aem,aws,centos7,aem63)

gen-packer-aem-aws-centos7-aem64: init
	$(call gen_packer_aem,aws,centos7,aem64)

gen-packer-aem-aws-amazon-linux2-aem62: init
	$(call gen_packer_aem,aws,amazon-linux2,aem62)

gen-packer-aem-aws-amazon-linux2-aem63: init
	$(call gen_packer_aem,aws,amazon-linux2,aem63)

gen-packer-aem-aws-amazon-linux2-aem64: init
	$(call gen_packer_aem,aws,amazon-linux2,aem64)

gen-packer-aem-docker-centos7-aem62: init
	$(call gen_packer_aem,docker,centos7,aem62)

gen-packer-aem-docker-centos7-aem63: init
	$(call gen_packer_aem,docker,centos7,aem63)

define gen_packer_aem
  rm -rf packer-aem/$(1)-$(2)-$(3)
	mkdir -p packer-aem/$(1)-$(2)-$(3)
	cp packer-aem/src/sandpit.yaml packer-aem/$(1)-$(2)-$(3)/
	cp packer-aem/src/platform-$(1).yaml packer-aem/$(1)-$(2)-$(3)/
	cp packer-aem/src/os-$(2).yaml packer-aem/$(1)-$(2)-$(3)/
	cp packer-aem/src/$(3).yaml packer-aem/$(1)-$(2)-$(3)/
endef
