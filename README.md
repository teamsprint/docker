# docker images for private use

The main purpose of this project is to help developer quickly start multinode cluster with docker containers on a docker runtime.

But, this may help you to build a real cluster environment.

Instruction
-----------
* Add network to docker runtime
  * sudo docker network create **<network-name>**

* Build image
  * cd hadoop (or hive, spark, etc.)
  * ./build-image.sh
  * ./start-cluster.sh **<node-count>** **<hostname-prefix>** **<network-name>**

Result You Get
--------------
* 1 master node prepared
  * that named as **<hostname-prefix>**-master
  * /root/namenode-format.sh
  * /root/start-hadoop.sh
  * /root/run-wordcount.sh (test simple)
  * Port exposed
    * see Dockerfile or start-container.sh for the detail
* (**<node-count>** - 1) slave nodes prepared
  * that named as **<hostname-prefix>**-slave**1~<node-count>**
* Authentication-free ssh connecting
  * sshd on each server running
  * Name resolution for all nodes as the hostnames above

Note
----
* To-be architecture (micro-service?) has not been settled yet.
  * Hive, spark, etc. could include hadoop in itself for a while.
