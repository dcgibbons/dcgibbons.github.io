---
layout: post
title: Oddities in Gathering Windows Performance Data
date: 2009-02-17 20:39:08.000000000 -08:00
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
- monitoring
- perfmon
- Windows
meta:
  _edit_last: '1'
  wp-syntax-cache-content: "a:1:{i:1;s:2654:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"python\" style=\"font-family:monospace;\">size <span
    style=\"color: #66cc66;\">=</span> <span style=\"color: #ff4500;\">65536</span>
    <span style=\"color: #808080; font-style: italic;\"># starting size, probably
    computed from a previous registry call</span>\nparams.<span style=\"color: #ff7700;font-weight:bold;\">in</span>.<span
    style=\"color: black;\">data</span> <span style=\"color: #66cc66;\">=</span> params.<span
    style=\"color: black;\">out</span>.<span style=\"color: black;\">data</span> <span
    style=\"color: #66cc66;\">=</span> buffer<span style=\"color: black;\">&#40;</span>size<span
    style=\"color: black;\">&#41;</span>\n<span style=\"color: #ff7700;font-weight:bold;\">while</span>
    <span style=\"color: #ff4500;\">1</span>:\n    params.<span style=\"color: #ff7700;font-weight:bold;\">in</span>.<span
    style=\"color: black;\">size</span> <span style=\"color: #66cc66;\">=</span> size\n
    \   params.<span style=\"color: black;\">out</span>.<span style=\"color: black;\">size</span>
    <span style=\"color: #66cc66;\">=</span> <span style=\"color: #ff4500;\">0</span>\n
    \   dcerpc_winreg_QueryValue<span style=\"color: black;\">&#40;</span>params<span
    style=\"color: black;\">&#41;</span>\n    <span style=\"color: #ff7700;font-weight:bold;\">if</span>
    params.<span style=\"color: black;\">out</span>.<span style=\"color: black;\">result</span>
    <span style=\"color: #66cc66;\">==</span> ERROR_MORE_DATA:\n        size <span
    style=\"color: #66cc66;\">=</span> size + <span style=\"color: #ff4500;\">65536</span>
    <span style=\"color: #808080; font-style: italic;\"># add another 64 Kbytes of
    data to the buffer</span>\n        params.<span style=\"color: #ff7700;font-weight:bold;\">in</span>.<span
    style=\"color: black;\">data</span> <span style=\"color: #66cc66;\">=</span> params.<span
    style=\"color: black;\">out</span>.<span style=\"color: black;\">data</span> <span
    style=\"color: #66cc66;\">=</span> buffer<span style=\"color: black;\">&#40;</span>size<span
    style=\"color: black;\">&#41;</span>\n        <span style=\"color: #ff7700;font-weight:bold;\">continue</span>\n
    \   <span style=\"color: #ff7700;font-weight:bold;\">break</span></pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">size = 65536 # starting size, probably
    computed from a previous registry call\r\nparams.in.data = params.out.data = buffer(size)\r\nwhile
    1:\r\n    params.in.size = size\r\n    params.out.size = 0\r\n    dcerpc_winreg_QueryValue(params)\r\n
    \   if params.out.result == ERROR_MORE_DATA:\r\n        size = size + 65536 #
    add another 64 Kbytes of data to the buffer\r\n        params.in.data = params.out.data
    = buffer(size)\r\n        continue\r\n    break</p></div>\n\";}"
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2009/02/17/oddities-in-gathering-windows-performance-data/"
---
At [Zenoss](http://www.zenoss.com/) we do quite a bit of remote monitoring of computers running Windows. In the Enterprise edition of the product, we collect raw performance counter data using the conventional remote Windows Registry APIs.

We ran into an issue recently with a customer running Windows 2000 where the data from the remote server was being truncated prematurely. Since we implement our own remote API (so we can run natively on Linux and with Python, rather than requiring Windows), there was some immediately concern we ran into a low-level bug in our protocol implementation. Thanks to the release of the [Windows Communications Protocols (MCPP)](http://msdn.microsoft.com/en-us/library/cc216513(PROT.10).aspx) last year we have great detail on how our API layer should function.

Reviewing the MCPP in detail compared to our implementation showed no bugs against the specification, but I did notice some odd behavior. Normally when using the RegQueryValue API you specify a NULL buffer point and a zero-length buffer size so that the call will provide the actual size of the buffer needed. With this particular customer's server I noticed that this behavior wasn't behaving as documented in the MCPP.

An error code of ERROR\_MORE\_DATA was being returned. The MCPP says that when this value is returned the server will populate the size output variable with the actual size in bytes of the needed buffer. In this case, the size was always the same size as the input. After some experimentation I found that if I passed in approximately 64 Kbytes more data the call would finally succeed.

While quite odd behavior, this is actually the documented and expected state in the Win32 API documentation for [RegQueryValueEx](http://msdn.microsoft.com/en-us/library/ms724911(VS.85).aspx), but not in the MCPP. Specificially, when using the HKEY\_PERFORMANCE\_DATA key the ERROR\_MORE\_DATA behaves differently and the caller has more responsibility in guessing an appropriate buffer size.

The following pseudo-code shows the basic flow for how RegQueryValueEx should be used, either for locally or remote performance data access.

```
size = 65536 # starting size, probably computed from a previous registry call params.in.data = params.out.data = buffer(size) while 1: params.in.size = size params.out.size = 0 dcerpc\_winreg\_QueryValue(params) if params.out.result == ERROR\_MORE\_DATA: size = size + 65536 # add another 64 Kbytes of data to the buffer params.in.data = params.out.data = buffer(size) continue break
```

After fixing that issue I was still left with one oddity. Let's say, for example, it took 293,500 bytes of data before the RegQueryValueEx call was successful. And yet, the actual amount of returned data would only be 195,000 bytes, or something similar. This behavior seems quite different than on the other Windows operating systems we have tried so far.

This is the first time we've tried our data collection against a Windows 2000 server running Exchange locally. Windows 2000 has also been the source of several other key behavior differences in how performance data is returned, so my current speculation is how the server actually determines what data to be returned varies greatly between operating system versions. We normally query the performance counter registry for only a subset of values. It may well be that on Windows 2000 a buffer size large enough to retrieve all performance counters is required, even though once the call is complete it actually used quite a bit less.

Quirky, but another bug gone.

