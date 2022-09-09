pipelineJob('prad-testing-pipeline') {
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
            scriptPath('test-aoc/Jenkinsfile')
        }
    }
}