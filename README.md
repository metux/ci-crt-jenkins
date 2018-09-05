
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

2DO:
----

A lot: see jenkins-master/2DO. For example, testbox and DUT nodes are not
provioned yet (needs some more work on the libvirt/r4d front ...)

Author:
--------

Enrico Weigelt, metux IT consult <info@metux.net>
