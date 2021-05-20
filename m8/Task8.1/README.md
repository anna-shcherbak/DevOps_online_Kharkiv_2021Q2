# Module 8 CICD

## TASK 8.1

Firstly, I installed Jenkins on the master machine (Ubuntu 16.04).

![Screenshot1](./Images/Screenshot1.png)

I created the first job “simple job” that just prints a few lines using *echo* command.

![Screenshot2](./Images/Screenshot2.png)

I created the second job example “job_deploy1” in Jenkins with deploy.

![Screenshot3](./Images/Screenshot3.png)

![Screenshot4](./Images/Screenshot4.png)

Then I configured a plugin “Publish Over SSH”.

![Screenshot5](./Images/Screenshot5.png)

![Screenshot6](./Images/Screenshot6.png)

I created a simple CI/CD pipeline example.

![Screenshot7](./Images/Screenshot7.png)

![Screenshot8](./Images/Screenshot8.png)

The next step was to configure nodes (slaves). I copied public key from master Jenkins to slaves, created on them directory “jenkins” and installed Java jdk. First slave had IP address 192.168.0.160, second one had 192.168.0.169.

The example of slave1 is presented in the figure below.

![Screenshot9](./Images/Screenshot9.png)

I created a simple job “simplejob2” to run on the slave1.

![Screenshot10](./Images/Screenshot10.png)

Also, I created simple Jenkins pipeline with pipeline script from SCM.

![Screenshot11](./Images/Screenshot11.png)

![Screenshot12](./Images/Screenshot12.png)

