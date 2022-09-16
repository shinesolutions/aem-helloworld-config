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

pipelineJob('test-aem-opencloud/test-ausp-profile') {
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
            scriptPath('test-aoc/test-ausp-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-shineworks-amazon-linux2-profile') {
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
            scriptPath('test-aoc/test-amazon-linux2-profile/Jenkinsfile')
        }
    }
}

pipelineJob('test-aem-opencloud/test-shineworks-rhel7-profile') {
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
            scriptPath('test-aoc/test-rhel7-profile/Jenkinsfile')
        }
    }
}