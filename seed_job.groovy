job('SonarQube-Integration') {
    description('Pipeline to integrate SonarQube analysis and deployment')
    scm {
        git('https://github.com/pranav-1244/proof-of-conflict.git')
    }
    triggers {
        scm('H/5 * * * *') // Poll SCM every 5 minutes
    }
    steps {
        // Add steps to run your pipeline script
        shell('jenkinsfile')
    }
}
