FROM jenkins/jenkins:lts

USER root
# it will be moved to /usr/jenkins_home/ so you should check that path
#RUN /usr/bin/ssh-keygen -t rsa -m PEM -q -N '' -f /var/jenkins_home/.ssh/id_rsa
RUN /usr/bin/git config --global user.email "jenkins@devops.com"
RUN /usr/bin/git config --global user.name "jenkins"

RUN apt update
RUN apt install -y iputils-ping
RUN apt install -y net-tools

