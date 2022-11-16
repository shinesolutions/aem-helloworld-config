pipelineJob('test-aem-opencloud/test-ap-profile') {
    triggers {
        cron("H 6 * * 1-5")
    }
    parameters {
        stringParam('AOC_CONFIG_PROFILE_STACK_BUILDER', 'aem-rhel7-aem65-jdk11-ap', 'Name of the stack-builder configuration profile.')
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                        credentials('pradkhandelwal')
                    }
                    branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-ap-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-nb-profile') {
    triggers {
        cron("H 10 * * 1-5")
    }
    parameters {
        stringParam('AOC_CONFIG_PROFILE_STACK_BUILDER','aem-rhel7-aem65-jdk8-nb ','Name of the stack-builder configuration profile.')
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                        credentials('pradkhandelwal')
                    }
                  branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-nb-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh1-rhel7-profile') {
    triggers {
        cron("H 14 * * 1-5")
    }
    parameters {
        stringParam('AOC_CONFIG_PROFILE_STACK_BUILDER', 'aem-rhel7-aem65-jdk11-sh', 'Name of the stack-builder configuration profile.')
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                        credentials('pradkhandelwal')
                    }
                    branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-sh1-rhel7-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh2-amazon-linux2-profile') {
    triggers {
        cron("H 16 * * 1-5")
    }
    parameters {
        stringParam('AOC_CONFIG_PROFILE_STACK_BUILDER', 'aem-amazon-linux2-aem65-jdk11-sh', 'Name of the stack-builder configuration profile.')
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                        credentials('pradkhandelwal')
                    }
                    branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-sh2-amazon-linux2-profile/Jenkinsfile')
        }
    }
}
