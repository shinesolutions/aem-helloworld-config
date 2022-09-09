pipelineJob('test-aem-opencloud/test-nb-profile) {
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