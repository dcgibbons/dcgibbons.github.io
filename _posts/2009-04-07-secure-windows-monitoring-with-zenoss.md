---
layout: post
title: Secure Windows Monitoring with Zenoss
date: 2009-04-07 17:50:06.000000000 -07:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Jobs
- Software Development
- Technology
- Zenoss
tags:
- DCOM
- msrpc
- RPC
- security
- Windows
- WMI
meta:
  _edit_last: '1'
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2009/04/07/secure-windows-monitoring-with-zenoss/"
---
Starting with version 2.3.x, [Zenoss](http://www.zenoss.com/ "Zenoss, Inc. corporate web site") can monitor computers running Microsoft Windows with a variety of data collection protocols: SNMP, WMI over DCOM/MS-RPC and Perfmon over MS-RPC.

In Zenoss Core, the status of Windows services and the Windows Event Log are monitored using [Windows Management Instrumentation (WMI)](http://msdn.microsoft.com/en-us/library/aa394582.aspx "Windows Management Instrumentation") queries over the DCOM/MS-RPC protocol. In the implementation of MS-RPC that Zenoss is based upon, authentication credentials are sent to the remote server using the [Windows Challenge / Response (NTLM) mechanism](http://msdn.microsoft.com/en-us/library/aa378749.aspx "Microsoft NTLM"). Using this authentication mechanism, the actual password is never sent across the network, but rather the server produces a "challenge" value that the client must calculate using the password rather than sending it across the network.

NTLM authentication is the same mechanism that Windows devices themselves use for client/server communications, such as file sharing and remote administration.

Starting with version 2.3.x, Zenoss Enterprise gathers Perfmon data using the remote Windows registry API over the MS-RPC protocol. This technique is both more efficient and secure than the previous one. The same authentication mechanism used by Zenoss's WMI library is used here, providing the same level of security.

Prior to version 2.3.x, Zenoss Enterprise used a different mechanism to collect Perfmon data from Windows devices. This mechanism used a utility known as [winexe](http://eol.ovh.org/winexe/ "winexe homepage :)") to remotely execute commands on the Windows device (in this case, the typeperf.exe Windows utility). Unfortunately, the winexe utility sends the username and password used for authentication across the network in clear text, providing a less than ideal configuration for security.

Zenoss users monitoring Windows devices should be running version 2.3.3 or newer for the best possible security when communicating with those devices.

