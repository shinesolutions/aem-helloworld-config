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
package_datestamp := $(shell /bin/date "+%Y%m%d")
stack_prefix_con := aoc-con-$(timestamp)
stack_prefix_fs := aoc-fs-$(timestamp)
stack_manager_stack_prefix := aoc-stack-mgr-$(timestamp)
content_package_version := 0.0.2
content_package := s3://aem-aws-stack-builder/aem-helloworld-content-$(content_package_version).zip

deps:
	npm install -g nestor

machine-images: rhel7-aem65-jdk8-machine-images

rhel7-aem65-jdk8-machine-images:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/author/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/author-publish-dispatcher/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/dispatcher/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/java/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/publish/" "ENABLE_SLACK_NOTIFICATIONS=true"

rhel7-aem65-jdk8-manage-environments-consolidated:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/manage-environments/job/aws/job/aem-consolidated-rhel7-aem65-jdk8-sandpit-sandpit/job/create-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/manage-environments/job/aws/job/aem-consolidated-rhel7-aem65-jdk8-sandpit-sandpit/job/delete-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/manage-environments/job/aws/job/aem-consolidated-rhel7-aem65-jdk8-sandpit-sandpit/job/switch-dns-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	AUTHOR_PUBLISH_DISPATCHER_RECORD_SET=$(stack_prefix_con)&\
	AUTHOR_PUBLISH_DISPATCHER_HOSTED_ZONE=aemopencloud.cms&\
	ENABLE_SLACK_NOTIFICATIONS=true"

rhel7-aem65-jdk8-manage-environments-full-set:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/manage-environments/job/aws/job/aem-full-set-rhel7-aem65-jdk8-sandpit-sandpit/job/create-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/manage-environments/job/aws/job/aem-full-set-rhel7-aem65-jdk8-sandpit-sandpit/job/delete-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/manage-environments/job/aws/job/aem-full-set-rhel7-aem65-jdk8-sandpit-sandpit/job/switch-dns-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	PUBLISH_DISPATCHER_HOSTED_ZONE=aemopencloud.cms&\
	PUBLISH_DISPATCHER_RECORD_SET=$(stack_prefix_fs)-publish-dispatcher&\
	AUTHOR_DISPATCHER_HOSTED_ZONE=aemopencloud.cms&\
	AUTHOR_DISPATCHER_RECORD_SET=$(stack_prefix_fs)-author-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

operational-tasks-consolidated:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-offline-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-offline-compaction-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/list-packages/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/enable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/disable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/flush-dispatcher-cache/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/deploy-artifacts-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/check-readiness-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/deploy-artifact/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	AEM_ID=author&\
	PACKAGE_ACTIVATE=false&\
	PACKAGE_FORCE=true&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_REPLICATE=true&\
	PACKAGE_SOURCE=$(content_package)&\
	PACKAGE_VERSION=$(content_package_version)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/deploy-artifact/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	AEM_ID=publish&\
	PACKAGE_ACTIVATE=false&\
	PACKAGE_FORCE=true&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_REPLICATE=true&\
	PACKAGE_SOURCE=$(content_package)&\
	PACKAGE_VERSION=$(content_package_version)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/export-packages-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/import-package/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	AEM_ID=author&\
	PACKAGE_DATESTAMP=$(package_datestamp)&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_SOURCE_STACK_PREFIX=$(stack_prefix_fs)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/import-package/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	AEM_ID=publish&\
	PACKAGE_DATESTAMP=$(package_datestamp)&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_SOURCE_STACK_PREFIX=$(stack_prefix_fs)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/live-snapshot/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/offline-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/offline-compaction-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)\&
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-live-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-offline-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-offline-compaction-snapshot-consolidated/" \
	"STACK_PREFIX=$(stack_prefix_con)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

operational-tasks-full-set:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-standby&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-offline-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/unschedule-offline-compaction-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/list-packages/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/list-packages/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/enable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/enable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\"
	AEM_COMPONENT=publish&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/disable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/disable-crxde/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/flush-dispatcher-cache/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/flush-dispatcher-cache/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/deploy-artifacts-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/check-readiness-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

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
	PACKAGE_SOURCE=$(content_package)&\
	PACKAGE_VERSION=$(content_package_version)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

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
	PACKAGE_SOURCE=$(content_package)&\
	PACKAGE_VERSION=$(content_package_version)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/export-packages-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/import-package/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	AEM_ID=author&\
	PACKAGE_DATESTAMP=$(package_datestamp)&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_SOURCE_STACK_PREFIX=$(stack_prefix_fs)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/import-package/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	AEM_ID=publish&\
	PACKAGE_DATESTAMP=$(package_datestamp)&\
	PACKAGE_GROUP=shinesolutions&\
	PACKAGE_NAME=aem-helloworld-content&\
	PACKAGE_SOURCE_STACK_PREFIX=$(stack_prefix_fs)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/live-snapshot/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/live-snapshot/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/offline-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/offline-compaction-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)\&
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-primary&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=author-standby&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-live-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	AEM_COMPONENT=publish&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-offline-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/schedule-offline-compaction-snapshot-full-set/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/promote-author/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	STACK_MANAGER_STACK_PREFIX=$(stack_manager_stack_prefix)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/test-acceptance/job/sandpit/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	AEM_ARCHITECTURE=full-set&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/test-aem-security/job/sandpit/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	AEM_SECURITY_TEST_PLAN=author&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/test-aem-security/job/sandpit/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	AEM_SECURITY_TEST_PLAN=publish&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/test-aem-security/job/sandpit/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	AEM_SECURITY_TEST_PLAN=publish-dispatcher&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/test-contenthealthcheck-alarm/job/sandpit/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	ENABLE_SLACK_NOTIFICATIONS=true"

	nestor build "aem-opencloud-$(AOC_VERSION)/job/operational-tasks/job/sandpit/job/test-recovery/job/sandpit/" \
	"STACK_PREFIX=$(stack_prefix_fs)&\
	AEM_ARCHITECTURE=full-set&\
	ENABLE_SLACK_NOTIFICATIONS=true"

