# Module 10 Ansible
## TASK 10.1

First, I created a simple [*hosts.txt*](./hosts.txt) file. An Ansible master has 192.168.0.108 IP address, linux1 has 192.168.0.160 and linux2 has 192.168.0.143.

![Screenshot1](./Images/Screenshot1.png)

Then, I used the ping module to ping all the nodes in the inventory.

![Screenshot2](./Images/Screenshot2.png)

Also, I used *ansible-inventory* to display the configured inventory.

![Screenshot3](./Images/Screenshot3.png)

Then I ran the [*playbook.yml*](./playbook.yml) file with the following file contents:

![Screenshot4](./Images/Screenshot4.png)

The result presented in the figures below.

![Screenshot5](./Images/Screenshot5.png)

Linux1 

![Screenshot6](./Images/Screenshot6.png)

Linux2

![Screenshot7](./Images/Screenshot7.png)
