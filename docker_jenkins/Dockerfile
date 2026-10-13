FROM jenkins/jenkins:lts
# Maintainer instruction is deprecated in favor of using label
#MAINTAINER  "Price Tseng everett6802@hotmail.com"

ENV JENKINS_ADMIN_ID=lab
ENV JENKINS_ADMIN_PASSWORD=lab4man1
# 跳過初始設定畫面
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# 建立 admin user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/default-user.groovy

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
      > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

# 安裝常用 plugin
RUN jenkins-plugin-cli --plugins \
    git \
    github \
    credentials-binding \
    ssh-agent \
    workflow-aggregator \
    pipeline-stage-view \
    docker-workflow \
    email-ext \
    junit \
    htmlpublisher \
    rebuild \
    copyartifact

# For backup copy to google drive
RUN curl -fsSL https://rclone.org/install.sh | bash

USER jenkins