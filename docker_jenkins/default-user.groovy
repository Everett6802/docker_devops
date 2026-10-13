#!groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(
    System.getenv("JENKINS_ADMIN_ID") ?: "lab",
    System.getenv("JENKINS_ADMIN_PASSWORD") ?: "lab4man1"
)
instance.setSecurityRealm(hudsonRealm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)

instance.save()