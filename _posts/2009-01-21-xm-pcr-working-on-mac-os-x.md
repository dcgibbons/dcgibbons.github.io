---
title: XM PCR Working on Mac OS X
date: 2009-01-21 21:53:47.000000000 -08:00
type: post
categories: [technology]
tags: []
author: chadwick
permalink: "/2009/01/21/xm-pcr-working-on-mac-os-x/"
---
When the [XM PCR](http://en.wikipedia.org/wiki/XM_PCR) radio came out in 2003
I immediately bought one so I could use it at the office. The computer
controlled aspect of the radio was great and less messy than some of the other
XM radio options available at the time.

We used it for a while, but it sat languishing unused for the past few years.
I dug it out and tried to see if I could get it to work with my Mac. It turns
out the community has done a good job of writing tools for this device.

On the Mac, an application called [JXM](http://javaxm.sourceforge.net/) is
available that controls the radio. It provides a straightforward Java-based
application that uses the Java serial communication extensions to do its dirty
work. Getting the communications layer to work is the tricky part.

The XM PCR is a USB based serial device using a very common chipset from [FTDI
Chip](http://www.ftdichip.com/Drivers/VCP.htm). After installing the FTDI Chip
driver and connecting the XM PCR to the Mac, you should see the following
displayed in system.log

```
Jan 21 20:20:46 catfight kernel[0]: FTDIUSBSerialDriver:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 4036001 start - ok
```

Now you just need one more crucial piece - a working implementation of the
Java communication extensions, which Apple annoyingly does not provide on
their own. A commonly used open source package to provide this functionality
is [RXTX](http://rxtx.qbang.org/wiki/index.php/Main_Page). This software can
be built and installed manually, or you can use an installer than the
[JMRI](http://jmri.sourceforge.net/install/MacOSX.html) folks have so nicely
built for us. Once installed, JXM should run and be able to successfully open
the communication port created by the FTDI Chip driver.

In my case, the XM PCR had been turned off for so long that the radio was
inactive. Luckily the XM website makes it easy to refresh a radio that has
fallen into this state and it only took a few minutes to get the radio back in
action.

Unfortunately the XM PCR cannot make the channels suck any less after the
wonderful [Sirius XM swizzle](http://xmradio.com/onxm/lineup.xmc).

