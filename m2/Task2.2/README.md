# TASK 2.2

I created my own Amazon Linux instance in Amazon Lightsail and connected to it.

![Screenshot1]( ./Screenshots/Screenshot1.png)

In order to launch Linux Virtual Machine without Amazon Lightsail I used **Amazon EC2** and launched **CentOS 7**. During this process, I created a key pair to log in to the instance securely and changed permission of the private key file so that only I could read it. Besides, I configured a Security Group and added inbound and outbound rules to be able to connect via SSH.
Having done this, I made attempt to connect to newly launched instance using `ssh` and it was a success.

![Screenshot2]( ./Screenshots/Screenshot2.png)

Then, I created a [snapshot](./Screenshots/Screenshot3.png) of CentOS. And in future it could be used as a baseline for new volumes or for data backup.

I created and attached a completely new volume **Disk_D** (General Purpose SSD) using **Amazon EBS** as a secondary storage. Along with this, I formated the volume with file system and then mounted it on CentOS by doing this steps:

1. I checked if there was any file system on the volume using `sudo file -s /dev/xvdf`.
2. I used the `sudo mkfs -t xfs /dev/xvdf` command to create a file system on the volume.
3. I also created a mount point and mounted the volume at that directory.
4. In order to mount an attached EBS volume on every system reboot, an entry for the device was added to the */etc/fstab* file.

![Screenshot4]( ./Screenshots/Screenshot4.png)

Additionly, a new file *file1.txt* was created on this volume.

![Screenshot5]( ./Screenshots/Screenshot5.png)

I launched the third instance **CentOS_2** from previously created snapshot and detached Disk_D from the 2nd instance and attach it to the new instance.

![Screenshot6](./Screenshots/Screenshot6.png)

The next step was to launch and configure a WordPress instance with **Amazon Lightsail**. Getting the website up and running with Lightsail was pretty straightforward and it took less then 10 minutes to do. I used [**freenom.com**](https://www.freenom.com/en/index.html) to register a new domain. There I configured  addresses of nameservers and added DNS A record.

As a result, the [site](./Screenshots/Screenshot7.png) was up and running.

 Then, I created an **Amazon S3** bucket, uploaded a file, retrieved it and deleted it via **AWS CLI**.

![Screenshot8](./Screenshots/Screenshot8.png)

I configured and deployed  Docker Container, attached a load balancer to an Amazon ECS service and launched a web [application](./Screenshots/Screenshot9.png).

Last but not least, I created a static [website](http://annashcherbak.ga/) on Amazon S3 that is publicly available.
I used already registered domain and I added a DNS CNAME entry to point to the Amazon S3 website endpoint. Consequently, requests to <http://annashcherbak.ga/> are routed to <http://myawsbucket.anna.s3-website.eu-central-1.amazonaws.com/>.

PS. If you use <http://annashcherbak.ga/> link, site may not load the first time, please reload the page again, or use [this link](<http://myawsbucket.anna.s3-website.eu-central-1.amazonaws.com/>).