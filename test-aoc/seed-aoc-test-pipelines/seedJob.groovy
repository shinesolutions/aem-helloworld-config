pipelineJob('test-aem-opencloud/test-nb-profile') {
    parameters {
        stringParam('AOC_CONFIG_PROFILE_STACK_BUILDER','aem-rhel7-aem65-jdk11-ap','Name of the stack-builder configuration profile.')
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

pipelineJob('test-aem-opencloud/test-ap-profile') {
    parameters {
        stringParam('AOC_CONFIG_PROFILE_STACK_BUILDER', 'aem-rhel7-aem65-jdk8-nb', 'Name of the stack-builder configuration profile.')
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

pipelineJob('test-aem-opencloud/test-sh1-rhel7-profile') {
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
