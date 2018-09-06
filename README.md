
Dockerized Jenkins environment for CI-RT
-----------------------------------------

* automatically builds docker images for jenkins itself, as well as build nodes
* automatically provisions jenkins environment

Bootstrap:
----------

As jenkins itself is used for building everything, a jenkins environment needs
to be bootstrapped. This can be done by two ways:

a) add/build this repo in an existing Jenkins (w/ docker support) via Jenkinsfile
b) run 'make build' in ./jenkins-master

Once the jenkins image (cirt-jenkins-master) is built, it can be started via:
   'make run' in ./jenkins-master

Quirks:
-------

Few things still might need to be set manually (until I've found a way to automatize
that, too):

    * master and docker slaves need >1 concurrent jobs - otherwise stalls
    * jenkins may not try to pull locally built images - always fails the whole
      pipeline (docker plugin isn't intelligent enough to detect that the image
      is already there)

2DO:
----

A lot: see jenkins-master/2DO. For example, testbox and DUT nodes are not
provioned yet (needs some more work on the libvirt/r4d front ...)

* jenkins-master:
    * use a minimal base image (eg. dng-based) and drop unnecessary stuff
    * make /var/lib/apt/lists/ a separate volume, to keep temp data out of the image
    * drop all systemd stuff (not needed)
    * drop X11 stuff (seems to be pulled in by jdk)
    * put unpacked war and plugins to separate (temporary) volume
    * pluggable extra init scripts (eg. for starting extra services)
    * move postgresql to extra container
    * setup R4D VMs
    * bootstrap libvirt-slave.hpi instead of bundled binary
    * configure mailhost w/ external smarthost

Author:
--------

Enrico Weigelt, metux IT consult <info@metux.net>
