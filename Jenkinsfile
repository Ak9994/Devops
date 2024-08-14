def InstallTerraform(){

    //Check Terraform Installation
    def CheckTerraform = sh(script: 'which terraform',returnstatus: true)
    
    if(CheckTerraform != 0){
        //install
        sh 'wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip'
        sh 'unzip terraform_1.0.0_linux_amd64.zip'
        sh 'sudo mv terraform /usr/local/bin/'
        sh 'rm -f terraform_1.0.0_linux_amd64.zip'
    } else {
        echo "Terraform already Installed"
    }
}

pipeline{
    agent any

    stages{
        stage('Checkout'){
            steps{
              cleanWs()
              checkout scm
            }
        }

        stage('Install Terraform'){
            steps{
                script{
                    InstallTerraform()
                }
            }
        }

        stage('Terraform Deployment'){
            steps{
                script{
                    dir('deployment'){
                        sh 'terraform init'
                        sh 'terraform plan'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
