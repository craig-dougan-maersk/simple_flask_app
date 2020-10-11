def reponame="simple_flask_app"
def registry_url="registry.dougan.io:8000"
def image_name=reponame
def image_tag="latest"
def image_url=registry_url + '/' + reponame + ':' + image_tag
node('master')
{
    stage('checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: "https://github.com/csdougan/" + reponame + ".git"]]])

    }
    stage('docker_test') {
        sh 'docker images > /dev/null'
        sh 'echo "can connect to the docker daemon ok."'
    }
    stage('build') {
        sh 'ls -lrt'
        sh 'docker build -t image_url + ' .'
    }
    stage('run') {
      sh 'docker run -d -p8000:80 --name ' + reponame + ' ' + image_url
    }
    stage('test') {
      sh 'curl http://localhost:8000'
    }
}

