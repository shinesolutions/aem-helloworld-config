ifndef JENKINS_USER
    $(error Please specify environment variable JENKINS_USER)
endif
ifndef JENKINS_TOKEN
    $(error Please specify environment variable JENKINS_TOKEN)
endif
ifndef AOC_VERSION
    $(error Please specify environment variable AOC_VERSION)
endif

export JENKINS_URL=https://$(JENKINS_USER):$(JENKINS_TOKEN)@jenkins.shineworks.io/
timestamp := $(shell /bin/date "+%Y%m%d-%H%M")
package_datestamp := $(shell /bin/data "+%Y+%m+%d")
stack_prefix_con := aoc-con-$(timestamp)
stack_prefix_fs := aoc-fs-$(timestamp)
stack_manager_stack_prefix := aoc-stack-mgr-$(timestamp)

deps:
	npm install -g nestor

machine-images: rhel7-aem65-jdk8-machine-images

rhel7-aem65-jdk8-machine-images:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/author/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/author-publish-dispatcher/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/dispatcher/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/java/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/publish/" "ENABLE_SLACK_NOTIFICATIONS=true"

operational-tasks-full-set:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-standby"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-offline-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-offline-compaction-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/list-packages/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/list-packages/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/enable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/enable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\"
	AEM_COMPONENT=publish"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/disable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/disable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/flush-dispatcher-cache/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-dispatcher"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/flush-dispatcher-cache/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish-dispatcher"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/deploy-artifacts-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/check-readiness-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/deploy-artifact/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	AEM_ID=author&\
	PACKAGE_ACTIVATE=false&\
	PACKAGE_FORCE=true&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_REPLICATE=true&\
	PACKAGE_SOURCE=s3://aem-aws-stack-builder/aem-helloworld-content-0.0.2.zip&\
	PACKAGE_VERSION=0.0.2"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/deploy-artifact/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	AEM_ID=publish&\
	PACKAGE_ACTIVATE=false&\
	PACKAGE_FORCE=true&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_REPLICATE=true&\
	PACKAGE_SOURCE=s3://aem-aws-stack-builder/aem-helloworld-content-0.0.2.zip&\
	PACKAGE_VERSION=0.0.2"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/export-packages-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/import-package/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	AEM_ID=author&\
	PACKAGE_DATESTAMP=$(package_datestamp)&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_SOURCE_STACK_PREFIX=$(stack_prefix_fs)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/import-package/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	AEM_ID=publish&\
	PACKAGE_DATESTAMP=$(package_datestamp)&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_SOURCE_STACK_PREFIX=$(stack_prefix_fs)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/live-snapshot/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/live-snapshot/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/offline-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/offline-compaction-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-standby"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-offline-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-offline-compaction-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/promote-author/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)"
