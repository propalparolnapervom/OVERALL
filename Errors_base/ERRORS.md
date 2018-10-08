

**When**

**What**

**So**

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





























