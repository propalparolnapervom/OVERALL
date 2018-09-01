

**When**

**What**

**So**

___________________________


**When**

New AWS EC2 instance just launched (from home) with previously successfully used (from work place) pre-configured identities (SG, VPC, ROLE, etc).

Security Groups allows Inbound/Outbound for TCP:22.

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





























