---
title: net-snmp snmpd failure in CentOS 5
date: 2008-06-10 15:27:05.000000000 -07:00
type: post
categories: [jobs, technology, zenoss]
tags: [snmp, zenoss]
author: chadwick
permalink: "/2008/06/10/net-snmp-snmpd-failure-in-centos-5/"
---
<p>I was recently testing <a href="http://www.zenoss.org/">Zenoss</a> on a
CentOS 5 system when I discovered that the <code>snmpd</code> component of
net-snmp would not start. There were no error messages in
<code>/var/log/snmpd.log</code> so this made diagnosis a bit tricky given I
had never used the tool before. :-)</p> <p>Running the daemon manually with
<code>snmpd -f</code> showed the following error:</p>

<pre>
snmpd: symbol lookup error: snmpd: undefined symbol: smux_snmp_select_list_get_length
</pre>
<p>A quick Google search found the following bug based upon that error: <a href="http://bugs.centos.org/view.php?id=2700">http://bugs.centos.org/view.php?id=2700</a> </p>
<p>This bug indicates that the <code>net-snmp-libs</code> package was not being updated when the <code>net-snmp</code> package was updated using CentOS's built-in update manager. A quick check validated this:</p>
<pre>
[root@cgibbons-dev CentOS]# rpm --query net-snmp
net-snmp-5.3.1-19.el5_1.4
[root@cgibbons-dev CentOS]# rpm --query net-snmp-libs
net-snmp-libs-5.3.1-14.el5
</pre>

<p>And then a quick update of the <code>net-snmp-libs</code> package solved the issue:</p>
<pre>
[root@cgibbons-dev ~]# yum update net-snmp-libs
Loading "installonlyn" plugin
Setting up Update Process
Setting up repositories
base                      100% |=========================| 1.1 kB    00:00     
updates                   100% |=========================|  951 B    00:00     
addons                    100% |=========================|  951 B    00:00    
extras                    100% |=========================| 1.1 kB    00:00     
Reading repository metadata in from local files
Resolving Dependencies
--> Populating transaction set with selected packages. Please wait.
---> Downloading header for net-snmp-libs to pack into transaction set.
net-snmp-libs-5.3.1-19.el 100% |=========================|  27 kB    00:00     
---
\> Package net-snmp-libs.i386 1:5.3.1-19.el5\_1.4 set to be updated --\> Running transaction check Dependencies Resolved ============================================================================= Package Arch Version Repository Size ============================================================================= Updating: net-snmp-libs i386 1:5.3.1-19.el5\_1.4 updates 1.2 M Transaction Summary ============================================================================= Install 0 Package(s) Update 1 Package(s) Remove 0 Package(s) Total download size: 1.2 M Is this ok [y/N]: Y Downloading Packages: (1/1): net-snmp-libs-5.3. 100% |=========================| 1.2 MB 00:00 Running Transaction Test Finished Transaction Test Transaction Test Succeeded Running Transaction Updating : net-snmp-libs ######################### [1/2] Cleanup : net-snmp-libs ######################### [2/2] Updated: net-snmp-libs.i386 1:5.3.1-19.el5\_1.4 Complete!

