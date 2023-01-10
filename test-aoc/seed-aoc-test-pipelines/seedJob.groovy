pipelineJob('test-aem-opencloud/test-ap-profile') {
    triggers {
        cron("H 8 * * 1,3,5")
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
                    }
                    branch('main')
                }
            }
            scriptPath('test-aoc/test-ap-profile/Jenkinsfile')
        }
    }
}

pelineJob('test-aem-opencloud/test-cb-profile') {
    triggers {
        cron("H 11 * * 1,3,5")
    }
    parameters {
        stringParam('AOC_CONFIG_PROFILE_STACK_BUILDER', 'aem-amazon-linux2-aem64-jdk8-cb', 'Name of the stack-builder configuration profile.')
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                    }
                    branch('main')
                }
            }
            scriptPath('test-aoc/test-cb-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-nb-profile') {
    triggers {
        cron("H 14 * * 1,3,5")
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
                    }
                  branch('main')
                }
            }
            scriptPath('test-aoc/test-nb-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh1-rhel7-profile') {
    triggers {
        cron("H 8 * * 2,4")
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
                    }
                    branch('main')
                }
            }
            scriptPath('test-aoc/test-sh1-rhel7-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh2-amazon-linux2-profile') {
    triggers {
        cron("H 11 * * 2,4")
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
                    }
                    branch('main')
                }
            }
            scriptPath('test-aoc/test-sh2-amazon-linux2-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh3-rhel7-internal-profile') {
    triggers {
        cron("H 13 * * 2,4")
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
                    }
                    branch('main')
                }
            }
            scriptPath('test-aoc/test-sh3-rhel7-internal-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh4-amazon-linux2-internal-profile') {
    triggers {
        cron("H 16 * * 2,4")
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
                    }
                    branch('main')
                }
            }
            scriptPath('test-aoc/test-sh4-amazon-linux2-internal-profile/Jenkinsfile')
        }
    }
}
