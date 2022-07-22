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

deps:
	npm install -g nestor

machine-images: rhel7-aem65-jdk8-machine-images

rhel7-aem65-jdk8-machine-images:
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/author/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/author-publish-dispatcher/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/dispatcher/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/java/" "ENABLE_SLACK_NOTIFICATIONS=true"
	nestor build "aem-opencloud-$(AOC_VERSION)/job/machine-images/job/aws/job/aws-rhel7-aem65-jdk8/job/publish/" "ENABLE_SLACK_NOTIFICATIONS=true"
