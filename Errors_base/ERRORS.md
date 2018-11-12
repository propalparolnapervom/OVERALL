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

Docker

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

Docker

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

Concourse

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

Concourse

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

Git

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

Helm + Concourse

There's a Helm-chart `oo` with service `audit` which is started by Concourse deploy pipline.

**What**

There's such service in Helm-chart `oo`, but pipeline run wasn't successful with following error
```
Error: UPGRADE FAILED: no Service with the name "audit" found
```

**So**

Helm-chart `oo` has been deployed manually.

Next pipeline run was successful.
___________________________



**When**

Docker 

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

As mentioned [here](https://github.com/docker/for-linux/issues/299), following should be run prior to run `sudo yum install docker-ce -y`: 
```
sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.42-1.gitad8f0f7.el7.noarch.rpm
```

___________________________

**When**

Helm


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

VirtualBox

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

Docker

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

Kubernetes

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

AWS

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

TunnelBlick (soft to connect to VPN).

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

AWS

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

AWS

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

Oracle DB

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

AWS

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

AWS

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





























