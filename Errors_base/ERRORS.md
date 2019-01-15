**When**

**What**

**So**

___________________________


**When**

**What**

**So**

___________________________



**When**

**What**

**So**

___________________________



**When**

**What**

**So**

___________________________

**When**

**What**

**So**

___________________________

**When**

**What**

**So**

___________________________

**When**

**What**

**So**

___________________________



**When**


**What**

**So**

___________________________

**When**

**What**

**So**

___________________________



**When**

**What**

**So**

___________________________

**When**

#SSH# + #AWS#

Trying to connect to the server with Private IP via Bastion server via SSH just after Bastion server was re-created.

(prior to that this worked fine)

**What**

```
ssh -o ProxyCommand='ssh -W %h:%p bastn-2018.eu-central-1.elb.amazonaws.com  -p 22' serg.brt@172.17.0.13

	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
	Someone could be eavesdropping on you right now (man-in-the-middle attack)!
	It is also possible that a host key has just been changed.
	The fingerprint for the ECDSA key sent by the remote host is
	SHA256:p/+2T/5ZcjtKOdl5T+/rva8QhBXCb226NH0hMdoAKm4.
	Please contact your system administrator.
	Add correct host key in /Users/sbur/.ssh/known_hosts to get rid of this message.
	Offending ECDSA key in /Users/sbur/.ssh/known_hosts:14
	ECDSA host key for [bastn-20180718150102767200000001-1123279014.eu-west-1.elb.amazonaws.com]:22222 has changed and you have requested strict checking.
	Host key verification failed.
	ssh_exchange_identification: Connection closed by remote host
```

**So**

Because of Bastion server recreation its host key has changed, but your `~/.ssh/known_hosts` file still contains its old value. 

Just remove old value for Bastion server from `.ssh/known_hosts` file and try to connect once again.

___________________________

**When**

#Ansible# + #AWS# + #Packer#

Trying to run Ansible playbook on the EC2 instance (Ubuntu) via Packer.

**What**

```
   xbs-builder-name: TASK [Gathering Facts] *********************************************************
    xbs-builder-name: fatal: [default]: FAILED! => {"changed": false, "module_stderr": "Shared connection to 127.0.0.1 closed.\r\n", "module_stdout": "/bin/sh: 1: /usr/bin/python: not found\r\n", "msg": "MODULE FAILURE", "rc": 127}
    xbs-builder-name:   to retry, use: --limit @/Users/sbur/overall/git_area/TOOLS/PACKER/Examples/Ex_7_update_reboot_os_ubuntu/provision_ansible/main_with_role.retry
```

**So**

It's all about Python. By default, Ansible uses Python 2.7 (yes, even the current version of Ansible 2.4 does) despite moves to migrate to Python3.

As such, your target system needs to have Python 2.7 installed in order for Ansible to control it. Unfortunately, Ubuntu Server 16.04 doesn't come with Python 2.7 installed by default but there is a quick fix...

So before creating source Ubuntu AMI for Paker, do it on the source EC2 Ubuntu instance:
```
sudo apt install python-minimal python-simplejson
```

___________________________

**When**

**What**

**So**

___________________________



**When**

#Packer#

Run Packer to build new AMI from old AMI

**What**

```
...
==> xbs-builder-name: Error waiting for SSH: ssh: handshake failed: ssh: unable to authenticate, attempted methods [publickey none], no supported methods remain
==> xbs-builder-name: Terminating the source AWS instance...
==> xbs-builder-name: Cleaning up any extra volumes...
==> xbs-builder-name: No volumes to clean up, skipping
==> xbs-builder-name: Deleting temporary security group...
==> xbs-builder-name: Deleting temporary keypair...
Build 'xbs-builder-name' errored: ssh: handshake failed: ssh: unable to authenticate, attempted methods [publickey none], no supported methods remain
```

**So**

Source AMI was Ubuntu and connection in Packer was configured via `ec2-user`.

It has to be changed to appropriate user for Ubuntu - `ubuntu`.

___________________________



**When**

#Concourse#

Deployment of our pipelines is not working.

**What**

```
./update-all-pipelines.sh ../pipelines.txt https://concourse.tools.devopenocean.studio/ 90poe_all

	parse error: Invalid numeric literal at EOF at line 1, column 98
```

**So**

`secrets.json` file is still ecncrypted.

Decrypt it:
```
terrahelp decrypt -file secrets.json -simple-key=...
```
___________________________

**When**

#OpenVPN#

User on Linux was provided with generated `.ovpn` file. This file didn't help him to get a connection.

**What**

```
openvpn vlad_dev.ovpn 

	Wed Jan  2 18:27:40 2019 OpenVPN 2.4.6 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Apr 24 2018
	Wed Jan  2 18:27:40 2019 library versions: OpenSSL 1.0.2g  1 Mar 2016, LZO 2.08
	Wed Jan  2 18:27:40 2019 Outgoing Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
	Wed Jan  2 18:27:40 2019 Incoming Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
	Wed Jan  2 18:27:40 2019 TCP/UDP: Preserving recently used remote address: [AF_INET]52.17.178.171:1194
	Wed Jan  2 18:27:40 2019 Socket Buffers: R=[87380->87380] S=[16384->16384]
	Wed Jan  2 18:27:40 2019 Attempting to establish TCP connection with [AF_INET]52.17.178.171:1194 [nonblock]
	Wed Jan  2 18:27:41 2019 TCP connection established with [AF_INET]52.17.178.171:1194
	Wed Jan  2 18:27:41 2019 TCP_CLIENT link local: (not bound)
	Wed Jan  2 18:27:41 2019 TCP_CLIENT link remote: [AF_INET]52.17.178.171:1194
	Wed Jan  2 18:27:41 2019 TLS: Initial packet from [AF_INET]52.17.178.171:1194, sid=62759820 d3242bd5
	Wed Jan  2 18:27:41 2019 VERIFY OK: depth=1, CN=ca.drydock.studio
	Wed Jan  2 18:27:41 2019 VERIFY KU OK
	Wed Jan  2 18:27:41 2019 Validating certificate extended key usage
	Wed Jan  2 18:27:41 2019 ++ Certificate has EKU (str) TLS Web Server Authentication, expects TLS Web Server Authentication
	Wed Jan  2 18:27:41 2019 VERIFY EKU OK
	Wed Jan  2 18:27:41 2019 VERIFY OK: depth=0, CN=server2.vpn.drydock.studio
	Wed Jan  2 18:27:41 2019 Control Channel: TLSv1.2, cipher TLSv1/SSLv3 ECDHE-RSA-AES256-GCM-SHA384, 2048 bit RSA
	Wed Jan  2 18:27:41 2019 [server2.vpn.drydock.studio] Peer Connection Initiated with [AF_INET]52.17.178.171:1194
	Wed Jan  2 18:27:43 2019 SENT CONTROL [server2.vpn.drydock.studio]: 'PUSH_REQUEST' (status=1)
	Wed Jan  2 18:27:43 2019 PUSH: Received control message: 'PUSH_REPLY,dhcp-option DNS 10.253.0.1,route 192.168.248.0 255.255.248.0,route 172.17.64.0 255.255.192.0,route 89.197.142.187 255.255.255.255,route 10.253.0.0 255.255.0.0,topology net30,ping 5,ping-restart 30,ifconfig 10.253.0.166 10.253.0.165,peer-id 0,cipher AES-256-GCM'
	Wed Jan  2 18:27:43 2019 OPTIONS IMPORT: timers and/or timeouts modified
	Wed Jan  2 18:27:43 2019 OPTIONS IMPORT: --ifconfig/up options modified
	Wed Jan  2 18:27:43 2019 OPTIONS IMPORT: route options modified
	Wed Jan  2 18:27:43 2019 OPTIONS IMPORT: --ip-win32 and/or --dhcp-option options modified
	Wed Jan  2 18:27:43 2019 OPTIONS IMPORT: peer-id set
	Wed Jan  2 18:27:43 2019 OPTIONS IMPORT: adjusting link_mtu to 1627
	Wed Jan  2 18:27:43 2019 OPTIONS IMPORT: data channel crypto options modified
	Wed Jan  2 18:27:43 2019 Data Channel: using negotiated cipher 'AES-256-GCM'
	Wed Jan  2 18:27:43 2019 Outgoing Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
	Wed Jan  2 18:27:43 2019 Incoming Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
	Wed Jan  2 18:27:43 2019 ROUTE_GATEWAY 172.29.8.1/255.255.248.0 IFACE=wlp4s0 HWADDR=48:51:b7:94:a2:19
	Wed Jan  2 18:27:43 2019 ERROR: Cannot ioctl TUNSETIFF tun: Operation not permitted (errno=1)
	Wed Jan  2 18:27:43 2019 Exiting due to fatal error
```

**So**

Latest `ovpn` version that user got via `apt-get` couldn't work with some parameters of generated `.ovpn` file.

User downloaded another `ovpn` version, which allowed him to get a connection.
___________________________

**When**

#Terraform#

Makin initialization of just created TF config file.

**What**

```
terraform init

	There are some problems with the configuration, described below.

	The Terraform configuration must be valid before initialization so that
	Terraform can determine which modules and providers need to be installed.

	Error: Error parsing /Users/sbur/overall/git_area/CONFIG_MANAGEMENT/TERRAFORM/Examples/Ex_4_provision_local/provision_local.tf: object expected closing RBRACE got: EOF
```
**So**

```
resource "aws_instance"  "inst_by_tf" {    
  ...
  provisioner "local-exec" {
    command = "echo This is public IP of created EC2: ${aws_instance.inst_by_tf.public_ip} > /tmp/ip_address.txt"
}
```

`}` symbol was missed in previous block.

```
resource "aws_instance"  "inst_by_tf" {    
  ...
  provisioner "local-exec" {
    command = "echo This is public IP of created EC2: ${aws_instance.inst_by_tf.public_ip} > /tmp/ip_address.txt"
                            }
}
```

___________________________



**When**

#Terraform#

Applying TF config file.

**What**

```
terraform apply plan.txt

	Error: Error applying plan:

	1 error(s) occurred:

	* provider.aws: error validating provider credentials: error calling sts:GetCallerIdentity: InvalidClientTokenId: The security token included in the request is invalid.
		status code: 403, request id: a60c48a1-09c9-11e9-8cdf-c9b2440b78ec

	Terraform does not automatically rollback in the face of errors.
	Instead, your Terraform state file has been partially updated with
	any resources that successfully completed. Please address the error
	above and apply again to incrementally change your infrastructure.
```

**So**

No AWS credentials were specified in TF config file.

So `~/.aws/credentials` file was taken by default.

Wrong credentials were specified in the file. 
___________________________
**When**

#Kubernetes#

User tries to get Kubernetes pods.

**What**

```
kubectl get pods

	Unabe to connect to the server: dial tcp 54.194.163.123: i/o timeout
```

**So**

1) Option #1 (User in L, so no VPN)

User: 

> Turns out the issue is with my particular ethernet connection. I have to use wifi in order to connect to k8s. I tried connecting on another ethernet connection and it worked.

2) Option #2 (User in K, son VPN)

Dev VPN was used to connect to the Test env. Test VPN has to be used insted.



___________________________



**When**

#Goss#

Running `goss` utility to test existing files with following `goss.yaml` file:
```
file:
  /usr/local/bin/concourse:
    exists: true
    owner: concourse
    group: concourse
    mode: 0755
    filetype: file
```

**What**

Run fails with error:
```
File: /usr/local/bin/concourse: mode:
     Expected
         <string>: 0555
     to equal
         <int>: 493
```

So instead of comparing file permissions (`<string>: 0555` with `<string>: 0755`), for example, it complains on some `<int>` value.

**So**


File `goss.yaml`should be updated:

... follofing string ...
```
mode: 0755
```

... has to be updated with ...
```
mode: "0755"
```
___________________________



**When**

#Packer# + #goss#

Running Packer build with goss as provisioning from Mac.

**What**

```
	...
	    xbs-builder-name: goss version v0.3.6
	==> xbs-builder-name: Uploading goss tests...
	    xbs-builder-name: Creating directory: /tmp/goss
	    xbs-builder-name: Uploading tests/goss.yaml
	==> xbs-builder-name: Running goss tests...
	    xbs-builder-name: Error: found 0 tests, source: ./goss.yaml
	==> xbs-builder-name: Terminating the source AWS instance...
	==> xbs-builder-name: Cleaning up any extra volumes...
	==> xbs-builder-name: No volumes to clean up, skipping
	==> xbs-builder-name: Deleting temporary security group...
	==> xbs-builder-name: Deleting temporary keypair...
	...
```

**So**

`goss.yaml` successfully pushed to temporary AWS instance, but some how its content is not valid: it treated as empty.

Its replacing by other tests fixes the problem.

___________________________

**When**

#Packer# + #Ansible#

Running Packer build with Ansible as provisioning from Mac.


**What**

```
    xbs-builder-name:
    xbs-builder-name: PLAY [Make sure traceroute and httpd packages are installed] *******************
    xbs-builder-name:
    xbs-builder-name: TASK [Gathering Facts] *********************************************************
==> xbs-builder-name: failed to handshake
    xbs-builder-name: fatal: [default]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Warning: Permanently added '[127.0.0.1]:56817' (RSA) to the list of known hosts.\r\nReceived disconnect from 127.0.0.1 port 56817:2: too many authentication failures\r\nDisconnected from 127.0.0.1 port 56817\r\n", "unreachable": true}
    xbs-builder-name: 	to retry, use: --limit @/Users/sbur/overall/git_area/TOOLS/PACKER/Examples/Ex_2/provision_ansible/main_with_role.retry
    xbs-builder-name:
    xbs-builder-name: PLAY RECAP *********************************************************************
    xbs-builder-name: default                    : ok=0    changed=0    unreachable=1    failed=0
    xbs-builder-name:
==> xbs-builder-name: Terminating the source AWS instance...
==> xbs-builder-name: Cleaning up any extra volumes...
==> xbs-builder-name: No volumes to clean up, skipping
==> xbs-builder-name: Deleting temporary security group...
==> xbs-builder-name: Deleting temporary keypair...
Build 'xbs-builder-name' errored: Error executing Ansible: Non-zero exit status: exit status 4
```

**So**

If mentioned [here](https://github.com/hashicorp/packer/issues/5746#issuecomment-356286112), on Mac this was fixed by removing of ssh-handshakes (by default their max nubmer is 6).

```
ssh-add -l

	4096 SHA256:adsf  (RSA)
	2048 SHA256:asdf  (RSA)
	2048 SHA256:vdfv  (RSA)
	2048 SHA256:dsrr  (RSA)
	2048 SHA256:eref  (RSA)
	2048 SHA256:baff  (RSA)
	2048 SHA256:werv  (RSA)
	
	
ssh-add -D

	All identities removed.
	
	
ssh-add -l

	The agent has no identities.
```
___________________________

**When**

#Helm#


**What**

```
Error: UPGRADE FAILED: no Service with the name "auditing-web"
```

**So**

Check [this](https://ninetypercent.atlassian.net/wiki/spaces/90POE/pages/197885962/Fix+Helm+deployment+issues)

___________________________

**When**

#Helm#

Deployment of `oo` with helm chart.

**What**

```
Error: UPGRADE FAILED: jobs.batch “auditing-init-db-0.0.10” already exists
```

**So**

You would need to delete all jobs with `kubectl` and then redeploy.
```
kubectl delete jobs --all
```

> This issue occures from time to time on older clusters (dev and staging)

___________________________



**When**

#sed#

Running `sed` command on MacOS, which works fine on Linux.


**What**

```
sed -i "s|</head>|<script>something</script></head>|g" text.html 

	sed: 1: "text.html": undefined label 'ext.html'
```

**So**

The `sed` command is a bit different in Mac OS X, the `-i` option required a parameter to tell what extension to add for the backup file.

To fix it, just add extension for backup file, for example ‘.bak’ :

```
sed -i '.bak' "s|</head>|<script>something</script></head>|g" text.html 
```


___________________________



**When**

#Helm#

Deploying via helm chart.

**What**

```
make install env=development valfile=de.yaml

	...
	[debug] Fetched stable/prometheus to /Users/oleksandrhrab/work/helm/dev_certs/cache/archive/prometheus-7.1.0.tgz

	Error: UPGRADE FAILED: the server could not find the requested resource
	make: *** [install] Error
```

**So**

Parameter `--wait` was removed to fix this problem.

___________________________

**When**

#Shell#

Script `array.sh` works with the `bash`:
```
#!/bin/bash

VAR_ARRAY=(
  "ZERO"
  "ONE"
  "TWO"
  "THREE"
)

echo ${VAR_ARRAY[1]}
echo ${VAR_ARRAY[3]}
```

It doesn't work with `sh`:
```
#!/bin/sh

VAR_ARRAY=(
  "ZERO"
  "ONE"
  "TWO"
  "THREE"
)

echo ${VAR_ARRAY[1]}
echo ${VAR_ARRAY[3]}
```

**What**

```
/array.sh: line 3: syntax error: unexpected "("
```

**So**

Take a look at your `sh`:
```
ls -la /bin/sh

                 lrwxrwxrwx    1 root     root            12 Sep 11 20:23 /bin/sh -> /bin/busybox
```

Both `busybox`'s `sh` (which is `ash`) and `dash` do not support arrays.

Array might be rewriten with any following way, for example:

1.
```
var="ZERO|ONE|TWO|THREE"
oldIFS=$IFS
IFS="|"
set -- $var
echo "${0}"
echo "${1}"
echo "${2}"
echo "${3}"
echo "${4}"
IFS=$oldIFS
```

2.
```
#!/bin/sh

var="0 1 2 3 4 5 6 7 8 9 10 11 12"

set -- $var

echo "${1}"
echo "${5}"
echo "${12}"
```

3.
```
#!/bin/sh


var="\
0 \
1 \
2 \
3 \
4 \
5 \
6 \
7 \
8 \
9 \
10 \
11 \
12\
"

set -- $var

echo "${1}"
echo "${5}"
echo "${12}"
```
___________________________

**When**

#Docker#

Build simplest Docker image with following `test.sh` within:
```
#!/bin/bash

echo
echo
echo "  A TEST MESSAGE FROM THE CONTAINER"
echo
echo
```

Appropriate Dockerfile:
```
FROM nginx:1.15-alpine

COPY ./test.sh /test.sh

CMD ["/test.sh"]
```


**What**

Docker build is successful, but when you try to run container:
```
standard_init_linux.go:190: exec user process caused "no such file or directory"
```

**So**

Apperently, `/bin/bash` is absent in `nginx:1.15-alpine`.

At least this update of `test.sh` helps:
```
#!/bin/sh

echo
echo
echo "  A TEST MESSAGE FROM THE CONTAINER"
echo
echo
```

___________________________



**When**

#Docker#

Build simplest Docker image with following `test.sh` within:
```
echo
echo
echo "  A TEST MESSAGE FROM THE CONTAINER"
echo
echo
```

**What**

Docker build is successful, but when you try to run container:
```
standard_init_linux.go:190: exec user process caused "exec format error"
```

**So**

Appropriate shell wasn't specified in `test.sh` file. 

This update fixed a problem:
```
#!/bin/bash

echo
echo
echo "  A TEST MESSAGE FROM THE CONTAINER"
echo
echo
```

___________________________



**When**

#Concourse#

Creating new pipeline.

**What**

```
error: yaml: unmarshal errors:
  line 34: field params not found in type atc.JobConfig
  line 39: field put not found in type atc.JobConfig
```

**So**

Specified lines were fine (this wasn't first draft of `pipeline.yml` file, they were in the part that wasn't changed and worked fine previously).

Next block of lines (`put` step) wasn't placed correctly: it was too left.

Fixed by placing this block a little bit to the right.
___________________________

**When**

#Concourse#

Playing with different image sources for nginx in the Concourse pipeline.

**What**

```
failed to stream out from volume
```

**So**

1. Helped me:

Re-create a pipeline.

Start with it's removing:
```
fly -t tutorial dp -p to_del
```

2. In general: the problem is [volume-related](https://github.com/concourse/concourse/issues/2314#issuecomment-401015733).

___________________________

**When**

#Git#

`git clone ...` after upgrading MacOS to Mojave.


**What**

```
git clone ...

	xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
```

**So**

```
xcode-select --install
```
___________________________



**When**

#Helm# + #Concourse#

There's a Helm-chart `oo` with service `audit` which is started by Concourse deploy pipline.

**What**

There's such service in Helm-chart `oo`, but pipeline run wasn't successful with following error
```
Error: UPGRADE FAILED: no Service with the name "audit" found
```

**So**

> Concourse was stalled so it couldnt install helm to Dev.

> Which probably caused it to fail initially, but we knew this could happen once we get to over 100 helm releases

A) First approach (fast one)

1. Checkout `helm` repository.

2. Rollback to last GOOD release
```
helm rollback openocean 0
``` 

3. Try to start applying deployments again.

If this approach doesn’t work - use heavy wait delete/install pattern


B) Re-install `oo` helm-chart (slow one: it takes ~20 mins for Dev env).


1. Checkout `helm` repository.

2. Delete `oo` helm-chart
```
make delete
``` 

3. Install it manually.

(it takes ~20 mins for Dev env)
```
make install
```

___________________________



**When**

#Docker#

Installation of Docker on the new CentOS server.


**What**

```
sudo yum install docker-ce

	...
	Error: Package: 3:docker-ce-18.09.0-2.1.rc1.el7.x86_64 (docker-ce-test)
		   Requires: container-selinux >= 2.9
	 You could try using --skip-broken to work around the problem
	 You could try running: rpm -Va --nofiles --nodigest
```

**So**

As mentioned [here](https://github.com/docker/for-linux/issues/299), following should be run prior to run `sudo yum install docker-ce -y` (prior to run the command, check package availability [here](http://mirror.centos.org/centos/7/extras/x86_64/Packages/)): 
```
sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.74-1.el7.noarch.rpm
```

___________________________

**When**

#Helm#


Key `--install` of `helm upgrade` has to install Helm chart if not installed.

Helm release with specific name `<email>` is absent in current releases:
```
helm --tls ls email
```



**What**

But the key is not working:
```
helm upgrade --install email-autodiscover . --tls --namespace default --debug --values values.yaml

	...
	Error: UPGRADE FAILED: "email-autodiscover" has no deployed releases
	make: *** [Makefile:14: install] Error 1
```


**So**

Helm release with specific name `<email>` is absent in current releases, BUT still present in the list of deleted:
```
helm ls -a --tls email

	NAME              	REVISION	UPDATED                 	STATUS 	CHART                   	APP VERSION	NAMESPACE
	email-autodiscover	1       	Tue Oct 30 16:58:49 2018	DELETED	email-0.0.1	           	default
```

That's because previous Helm release was deleted as
```
helm delete <email>
```

It allows to keep information about release for rollback.

So,

remove release fully prior to run it's installation:
```
helm delete --purge <email>
```

___________________________



**When**

#VirtualBox#

Installing VirtualBox on MacOS.

**What**

Error is occuring during install process:


The installation failed.

The installer encountered an error that caused the installation to fail. Contact the software manufacturer for assistance.


**So**

Option #1 from this [link](https://medium.com/@DMeechan/fixing-the-installation-failed-virtualbox-error-on-mac-high-sierra-7c421362b5b5):

1) Open up System Preferences
2) Click on theSecurity & Privacy icon
3) Hopefully you’ll see a message saying `System software from developer “Oracle America, Inc.” was blocked from loading`.
4) If you do see the message, click the lock icon in the bottom left of the window
5) Enter your Mac password
6) Then click the Allow button



___________________________



**When**

#Docker#

After successful login to Docker Hub `docker.io` ...
```
docker login -u xbu -p xbu docker.io

	WARNING! Using --password via the CLI is insecure. Use --password-stdin.
	Login Succeeded
```

... I was trying to push there `golang` Docker Image
```
docker images

	REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
	golang                   latest              45e48f60e268        2 days ago          777MB
```

**What**

```
docker push golang

	The push refers to repository [docker.io/library/golang]
	7a7147543a13: Layer already exists 
	757fc57926be: Layer already exists 
	52da4d4dcf59: Layer already exists 
	1191b3f5862a: Layer already exists 
	08a01612ffca: Layer already exists 
	8bb25f9cdc41: Layer already exists 
	f715ed19c28b: Layer already exists 
	errors:
	denied: requested access to the resource is denied
	unauthorized: authentication required
```

**So**

For Docker Image to be pushed to the docker images repo (Docker Hub, for example) a namespace (corresponds to Docker Hub user) has to be specified additionally. 

In this case: `xbu/golang` has to be pushed instead of `golang`.


So add a tag to already existing Docker Image
```
docker tag golang xbu/golang
```

Check it
```
docker images

	REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
	golang                   latest              45e48f60e268        2 days ago          777MB
	xburser2/golang          latest              45e48f60e268        2 days ago          777MB
```

Now push it
```
docker push xbu/golang
```



___________________________



**When**

#Kubernetes#

Running `kubectl ...` first time after installing.

**What**

```
kubectl get pods

	Error from server (NotAcceptable): unknown (get pods)
	Sergiis-MacBook-Pro:~ sbur$ kubectl version
	Client Version: version.Info{Major:"1", Minor:"12", GitVersion:"v1.12.0", GitCommit:"0ed33881dc4355495f623c6f22e7dd0b7632b7c0", GitTreeState:"clean", BuildDate:"2018-09-28T15:20:58Z", GoVersion:"go1.11", Compiler:"gc", Platform:"darwin/amd64"}
	Server Version: version.Info{Major:"1", Minor:"8", GitVersio\
	n:"v1.8.7", GitCommit:"b30876a5539f09684ff9fde266fda10b37738c9c", GitTreeState:"clean", BuildDate:"2018-01-16T21:52:38Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"linux/amd64"}
```


**So**

After installation of latest `kubectl` version the Client version was much newer then Server ones. 

```
kubectl version
Client Version: version.Info{Major:"1", Minor:"9", GitVersion:"v1.12.1", GitCommit:"57729ea3d9a1b75f3fc7bbbadc597ba707d47c8a", GitTreeState:"clean", BuildDate:"2018-06-29T01:14:35Z", GoVersion:"go1.9.3", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.7", GitCommit:"b30876a5539f09684ff9fde266fda10b37738c9c", GitTreeState:"clean", BuildDate:"2018-01-16T21:52:38Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"linux/amd64"}
```

Install any older version
```
cd ~
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.9.9/bin/darwin/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```



___________________________


**When**

#AWS#

Running `assume-role development` first time after initial configuration of [assume-role](https://github.com/remind101/assume-role).


**What**

```
assume-role ...

	panic: SharedConfigAssumeRoleError: failed to load assume role for arn:aws:iam::570255904933:role/90poe_role_admin, source profile has no shared credentials

	goroutine 1 [running]:
	github.com/remind101/assume-role/vendor/github.com/aws/aws-sdk-go/aws/session.Must(...)
		/Users/sbur/go/src/github.com/remind101/assume-role/vendor/github.com/aws/aws-sdk-go/aws/session/session.go:265
	main.assumeProfile(0x7ffeefbffc3c, 0xb, 0x0, 0x0, 0x13fe6e0)
		/Users/sbur/go/src/github.com/remind101/assume-role/main.go:171 +0x25e
	main.main()
		/Users/sbur/go/src/github.com/remind101/assume-role/main.go:91 +0x397
```      
      
      
**So**

Update `~/.aws` to have `[iam]` head instead of `[default]`.

___________________________


**When**

#TunnelBlick# (soft to connect to VPN).

Making first configuration.


**What**

Trying to make first VPN configuration after just installed TunnelBlick.

```
Warning

Tunnelblick could not fetch IP address information before the connection to sergii_test was made.
```


**So**

It might be that during installation of the TunnelBlick option **Check if the apparent public IP address changed after connecting** has been selected.


Click on TunnelBlick.

Click **VPN Details...**.

Highlight your configuration (in this case it's `sergii_test`).

Make sure that following checkbox is not selected: **Check if the apparent public IP address changed after connecting**. 


___________________________


**When**

#AWS#

Trying to switch role for IAM user via assume-role in the terminal.

**What**

```
assume-role mine todel_role_sts 619351

      Parameter validation failed:
      Invalid length for parameter SerialNumber, value: 4, valid range: 9-inf
```

**So**

???

___________________________



**When**

#AWS#

Trying to switch role for IAM user via assume-role in the terminal.

**What**

```
assume-role mine todel_role_sts 619351

      An error occurred (AccessDenied) when calling the GetUser operation: User: arn:aws:iam::891692259462:user/tester is not authorized to perform: iam:GetUser on resource: user tester
```

**So**

In the IAM root account 891692259462 (where user `tester` is) Role `IAMReadOnlyAccess` has been added for the user `tester`. 

___________________________




**When**

#Oracle DB#

Connecting to Oracle instance via `sqlplus` from your Windows Laptop.

**What**

```
sqlplus xbsadmin/xbsadmin@xbsdb;

      SQL*Plus: Release 12.2.0.1.0 Production on Fri Sep 21 13:06:36 2018
      Copyright (c) 1982, 2016, Oracle.  All rights reserved.
      ERROR:
      ORA-12154: TNS:could not resolve the connect identifier specified
```

**So**

Don't use `;`, it appears as part of TNS. Try this instead:
```
sqlplus xbsadmin/xbsadmin@xbsdb
```

___________________________



**When**

#AWS#

Downloading of `connect.php` file from S3 to EC2 instance via `wget` util.

**What**

```
wget https://s3.eu-central-1.amazonaws.com/xburser.com/connect.php

      --2018-09-19 15:51:44--  https://s3.eu-central-1.amazonaws.com/xburser.com/connect.php
      Resolving s3.eu-central-1.amazonaws.com (s3.eu-central-1.amazonaws.com)... 52.219.74.24
      Connecting to s3.eu-central-1.amazonaws.com (s3.eu-central-1.amazonaws.com)|52.219.74.24|:443... connected.
      HTTP request sent, awaiting response... 403 Forbidden
      2018-09-19 15:51:44 ERROR 403: Forbidden.
```

**So**

`connect.php` file on S3 was private. Making it public helps.

___________________________


**When**

AWS

Making Domain->S3 mapping in AWS Route53 service.

**What**

I’m creating an Amazon Route 53 [alias resource record set](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html) in the Route 53 console, but I can't select my preferred resource from the Alias Target list.

**So**

1. Make sure S3 bucket name (`xburser.com`) absolutely the same as your registered domain (`xburser.com`). 

2. Make sure S3 bucket name (`xburser.com`) is Static-Webpage bucket.

Find more options in official debug steps [here](https://aws.amazon.com/premiumsupport/knowledge-center/route-53-no-targets/)


___________________________

**When**

#AWS#

New AWS EC2 instance just launched (from home location) with previously successfully used (from work place) pre-configured identities (SG, VPC, ROLE, etc).

Security Groups allow Inbound/Outbound connections for TCP:22.

Non of the [Troubleshooting Cases](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html) was confirmed (missing route table, etc)


**What**

No ssh connection from local PC (from home) to EC2 Instance.
```
Network error: Connection timed out
```

Telnet from local PC (from home) to EC2 Instance public IP is not successfull.
```
C:\Users\pilat>telnet 27.234.34.34 22

      Connecting To 27.234.34.34...Could not open connection to the host, on port 22:
      Connect failed
```

**So**

It turned out, that home network wasn't allowed to use 22 port (some Firewall on the provider side???)

As soon as I used mobile network, SSH connection became available.





























