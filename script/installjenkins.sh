#get updates
yum update -y

#Install OpenJDK using Coretto
dnf install -y java-11-amazon-corretto-devel wget

#Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key

yum install -y jenkins

#Start Jenkins Service
systemctl enable jenkins
systemctl start jenkins

#Jenkins Key
cat /var/lib/jenkins/secrets/initialAdminPassword