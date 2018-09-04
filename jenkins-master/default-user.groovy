import hudson.security.*
import jenkins.model.*

def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
def users = hudsonRealm.getAllUsers()
users_s = users.collect { it.toString() }

print "=== SCANNING NDOES\n"

jenkins.model.Jenkins.instance.computers.each { c ->
//    print "NODE: "+c.node.name
//    c.nodes.each { n -> print "NODE: "+n.name }
    print "NAME: "+c.name
  }

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



/*
@NonCPS
def hostNames(label) {
  def nodes = []
  jenkins.model.Jenkins.instance.computers.each { c ->
    if (c.node.labelString.contains(label)) {
      nodes.add(c.node.selfLabel.name)
    }
  }
  return nodes
}
*/