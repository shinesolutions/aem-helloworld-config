pipelineJob('test-aem-opencloud/test-nb-profile') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                    }
                  branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-nb-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-ap-profile') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                    }
                    branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-ap-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh1-rhel7-profile') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                    }
                    branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-sh1-rhel7-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-sh2-amazon-linux2-profile') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('shinesolutions/aem-helloworld-config')
                    }
                    branch('adding-end-to-end-testing-profile')
                }
            }
            scriptPath('test-aoc/test-sh2-amazon-linux2-profile/Jenkinsfile')
        }
    }
}
