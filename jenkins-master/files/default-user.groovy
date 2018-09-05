import hudson.security.*
import jenkins.model.*

def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
def users = hudsonRealm.getAllUsers()
users_s = users.collect { it.toString() }

def env = System.getenv()

if (!(env.JENKINS_USER in users_s)) {
    println "--> creating local admin user"
    println env.JENKINS_USER
    println env.JENKINS_PASS

    hudsonRealm.createAccount(env.JENKINS_USER, env.JENKINS_PASS)
    instance.setSecurityRealm(hudsonRealm)

    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)
    instance.save()
}

/* set master node's initial labels */
// jenkins.model.Jenkins.instance.labelString = "docker-host"
instance.labelString = "docker-host"
instance.save()
