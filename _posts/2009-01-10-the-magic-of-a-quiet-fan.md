---
title: The Magic of a Quiet Fan
date: 2009-01-10 11:31:06.000000000 -08:00
type: post
categories: [jobs, technology, zenoss]
tags: []
author: chadwick
permalink: "/2009/01/10/the-magic-of-a-quiet-fan/"
---
A [previous
post](http://chadgibbons.com/2008/11/25/using-zenoss-core-to-watch-the-home-network/)
discussed using an [Intel
D945GCLF2](http://www.newegg.com/Product/Product.aspx?Item=N82E16813121359)
Atom-based mainboard for a little mini server setup. It's been working great,
except for that damn fan for the memory controller. It was pretty noisy at
first, but quickly degraded into a crunching worthless disaster.

The product review comments at newegg described this exact behavior so I
wasn't too surprised. My friend Matt replaced his with a $3 fan immediately
and has been happy with it since.

I opted for a slightly more expensive fan that is supposed to run at less than
14 dBA - a [Silenx Ixtrema Pro
Series](http://www.newegg.com/Product/Product.aspx?Item=N82E16835191001). It's
still a 40mm fan with the same depth but I can't hear it run at all. Product
reviews imply this fan won't stay quiet after about 6 months, so we'll see if
that happens. Ideally I'd just replace the crappy heatsink with a larger one
and maybe a heat pipe to the case.

Now the only noise in the system is the [WD Raptor
drive](http://wdc.custhelp.com/cgi-bin/wdc.cfg/php/enduser/std_adp.php?p_faqid=1405).
I've noticed the drive runs at between 50 and 55 degrees C since the case is
not actively cool, so that is on the hot side (WD's MTBF testing was done at
50 degrees). It is way overkill for this box, so I may replace it with a WD
Green Power drive, or just give up and do a small SSD.

But hey, I've got over a month of cool looking graphs out of
[Zenoss](http://www.zenoss.com/) now, such as my router network traffic:

![Zenoss Network Performance Graph]({{ site.baseurl }}/assets/images/picture-1.png "zenoss-network-graph")

