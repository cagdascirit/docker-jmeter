# docker-jmeter
Jmeter Docker Images (Jmeter-Base, Jmeter-Master and Jmeter-Slave) for Java performance/load tests. Images are ready to be run as Docker container and ready to run on [tutum](https://www.tutum.co). 

[Jmeter](http://jmeter.apache.org) and [Gatling](http:///gatling.io) sources were hacked so now Jmeter has capability to drive Gatling to run performance/load tests. That means you can run your Gatling Scala scripts to generate **distributed** performance/load tests driven by Jmeter. There is no change in Jmeter-master for this scenario but Jmeter-slaves trigger Gatling to run tests and collect results from Gatling and send them back to the master.

Use these (jmeter) parameters on master node for slaves drive Gatling:

`-GatlingMode=ON`
`-GatlingSimulationsPath=<simulations path>`
`-GatlingTestRunOptions=<gatling test run options>`

##### Sample Usage for Slave (cirit/jmeter:slave):
```sh
$ docker run -d -P --name slave1 -v /Users/cagdas/docker_mnt/:/jmeter_log cirit/jmeter:slave -j /jmeter_log/slave1.log
```
##### Sample Usage for Master (cirit/jmeter:master):
```sh
$ docker run -d -P --name master -v /Users/cagdas/docker_mnt/:/jmeter_log --link slave1 --link slave2 --link slave3 cirit/jmeter:master -t /jmeter_log/test.jmx -R slave1,slave2,slave3 -j /jmeter_log/master.log -l /jmeter_log/result.jtl -X
```

##### Sample Usage for Slave driving Gatling (cirit/jmeter:slave):
```sh
$ docker run -d -P --name gslave1 -v /Users/cagdas/docker_mnt/:/jmeter_log cirit/jmeter:slave_running_gatling -j /jmeter_log/gslave1.log
```
##### Sample Usage for Master (Gatling) (cirit/jmeter:master):
```sh
$ docker run -d -P --name gmaster -v /Users/cagdas/docker_mnt/:/jmeter_log --link gslave1 --link gslave2 --link gslave3 cirit/jmeter:master -t /jmeter_log/test_gatling.jmx -R gslave1,gslave2,gslave3 -j /jmeter_log/master.log -l /jmeter_log/result.jtl -X -GatlingMode=ON -GatlingSimulationsPath=/jmeter/simulations -GatlingTestRunOptions="-nr -m -s sample.TestSimulation"
```

##### Sample Usage for Slave on Tutum (cirit/jmeter:slave_on_tutum):
```yaml
jmeter-slave:
  image: cirit/jmeter:slave_on_tutum
  command: -p /jmeter/user.properties -j /jmeter/slave.log
  volumes:
    - /data/jmeter-slave:/jmeter
  links:
    - tomcat.infrastructure:tomcat
  target_num_containers: 10
  tags:
    - jmeter-slave
  restart: on-failure
  autodestroy: always
```
##### Sample Usage for Slave driving Gatling on Tutum (cirit/jmeter:slave_running_gatling_on_tutum):
```yaml
jmeter-slave:
  image: cirit/jmeter:slave_running_gatling_on_tutum
  command: -p /jmeter/user.properties -j /jmeter/slave.log
  volumes:
    - /data/jmeter-slave:/jmeter
  links:
    - tomcat.infrastructure:tomcat
  target_num_containers: 10
  tags:
    - jmeter-slave
  restart: on-failure
  autodestroy: always
```
##### Sample Usage for Master on Tutum (cirit/jmeter:master_on_tutum):
```yaml
jmeter-master:
  image: cirit/jmeter:master_on_tutum
  command: -t /jmeter/test_gatling.jmx -j /jmeter_out/master.log -l /jmeter_out/result.jtl -X -GatlingMode=ON -GatlingSimulationsPath=/jmeter/simulations -GatlingTestRunOptions="-nr -m -s sample.TestSimulation"
  volumes:
    - /data/jmeter-master:/jmeter
  links:
    - influxdb.infrastructure:influxdb
    - jmeter-slave
  tags:
    - jmeter-master
  restart: on-failure
  autodestroy: always
```
* Note: Just linking slave stack(s) is enough for master to discover slave nodes (yes that's it:)