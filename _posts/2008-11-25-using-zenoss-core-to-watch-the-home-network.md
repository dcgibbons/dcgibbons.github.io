---
title: Using Zenoss Core to Watch the Home Network
date: 2008-11-25 12:09:48.000000000 -08:00
type: post
categories: [jobs, technology, zenoss]
tags: [atoim, intel d945gclf2, monitoring, zenoss]
author: chadwick
permalink: "/2008/11/25/using-zenoss-core-to-watch-the-home-network/"
---
[Zenoss](http://www.zenoss.com/) is an open-source infrastructure management
product. Normally used by institutions to watch their networking and server
infrastructure, it also is used in smaller, less mission-critical scenarios.
Scenarios like mine: I want to monitor my home & home office infrastructure
since it has grown over time to contain a fair number of devices.

Without open-source alternatives like Zenoss, monitoring an extensive home or
small office network is cost prohibitive so it often just isn't done.

Since I also work for Zenoss, I'm often using various versions of Zenoss on my
development systems to watch the home network. But these installations are not
stable and long-running. One alternative I've considered is to install a new
Virtual Machine on my home workstation that is a Zenoss appliance, but the
issue here is that my home workstation is not always completely stable. I want
my Zenoss install to be stable and relatively free from interference from my
other activities. A dedicated server is the answer.

Normally I have enough spare computer parts in the closet that I could cobble
together a working machine, but no such luck this time. Since I was building a
server from scratch, I really did not want to go and build another large
machine that was power-hungry, loud or took up a lot of space. Intel has come
to the rescue with the new Atom-based systems that are very low power and use
the mini-ITX form factor.

I wound up choosing the [Intel
D945GCLF2](http://www.newegg.com/Product/Product.aspx?Item=N82E16813121359)
main-board that comes with a dual-core Intel Atom 330 already installed. I
configured it with [2GB of DDR2 667
memory](http://www.newegg.com/Product/Product.aspx?Item=N82E16820134192). I
picked an [Apex MI-100 case with 250W power
supply](http://www.newegg.com/Product/Product.aspx?Item=N82E16811154084) for
it all to live in. Since this case is passively cool the only noise in the
system is the small fan on the main-board's memory controller (the CPU is
passively cooled!) and any noise from the hard drive. I did have some spare
hard drives laying around, so I picked an older Western Digital 150GB Raptor
to help with system speed. Total out of pocket cost since I already had the
drive? $171.22 shipped from newegg.

[![IMG_0483]({{ site.baseurl }}/assets/images/3058224025_947e68dd86.jpg)](http://www.flickr.com/photos/26521676@N00/3058224025/ "IMG\_0483 by dcgibbons, on Flickr")

As you can see from the relative size of the hard drive the whole system is
tiny. I don't need an optical drive so if I wanted to put another 3.5" hard
drive in the case for mirroring purposes I could easily do so. Chances are
better than I'll eventually put a low-cost solid-state drive in the system as
a 16 or 32 GB size would be plenty.

[![IMG_0487]({{ site.baseurl }}/assets/images/3059061968_b4c603934c.jpg)](http://www.flickr.com/photos/26521676@N00/3059061968/ "IMG\_0487 by dcgibbons, on Flickr")

I put [Ubuntu](http://www.ubuntu.com/) server on the system and used the
network-based install to get it installed so I didn't need to put an optical
drive in the system. Rather than mess around with a network boot (which is
great when it works, but I never have a working server setup to host the boot
files) I just put the boot image on a USB memory stick and booted the core
installation from there. The only issue here was a drive number reordering
problem once the system was rebooted and the memory stick removed, but that
was easily fixed.

Once running the system is effectively like any other x86 based Linux server.
It's not even slow, as the 1.6 GHz dual-core Atom supplies plenty of computing
power. It's clearly not as fast as current or previous generation desktop or
server chips, but for building Zenoss I don't find it any slower than the
virtual machines in Zenoss's development VMware farm. In many ways, I like
having a slower system here to use because it helps keep me mindful of not
ever user has plenty of computing power to throw at our software.

I decided to run Zenoss using a source-based install, but instead of running
off the trunk I picked the [2.3.x
branch](http://dev.zenoss.org/trac/browser/branches/zenoss-2.3.x) to start
with. This branch is from the version we just released which is proving to be
our best release yet. I'll switch to new releases using the source install but
avoid the trunk given the large amount of turmoil that can occur there as new
features are integrated into the product.

After getting Zenoss running I let it discover my home network. As expected,
it found nearly all of the devices I have (13 out of the 16). There will be
some configuration to do on some of the devices to enable true monitoring, but
this is a great start.

[![ZenossHomeNetwork]({{ site.baseurl }}/assets/images/3058502475_9ca135e6a8.jpg)](http://www.flickr.com/photos/26521676@N00/3058502475/ "ZenossHomeNetwork by dcgibbons, on Flickr")

