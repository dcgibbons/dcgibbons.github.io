---
layout: post
title: Why is my car's satellite navigation system so stupid?
date: 2009-09-18 17:57:27.000000000 -07:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Technology
tags:
- Cars
- gps
- lame
- rant
meta:
  _edit_last: '1'
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2009/09/18/why-is-my-cars-satellite-navigation-system-so-stupid/"
---
I have two different late model (a 2006 and a 2007) GM vehicles with satellite navigation systems. Both are manufactured for GM by Denso, although they clearly have different implementations and features. The one thing they both share, however, is blatant stupidity when calculating routes.

I travel quite a bit between Houston and Austin and there are really only three reasonable ways to go: US-290; I-10 & TX-71; or I-10 & TX-183. Over the years my preference has moved from US-290 to I-10 & TX-71 as traffic along US-290 has increased on the eastern fridges of the Austin area, but the distance and time between the two is very similar and really it depends upon where in Austin you might be headed.

![]({{ site.baseurl }}/assets/images/3913527957_5875c4fbf4.jpg "GM GPS Route")

The GPS systems in my cars have three route options when you pick a destination: fastest, shortest and other. In both cars, the route displayed is none of the above three, but instead a long, out-of-the-way route of I-10 to Seguin before heading north on TX-123 to San Marcos, and then heading into Austin on I-35. This option is a whopping 222 miles with an estimated travel time of 3 hours and 39 minutes.

Now, the fastest route is usually not the shortest. Route calculations are supposed to take into account the actual speeds of the road segments involved, and since interstate highways are almost always faster than anything else, there is a natural preference to these roads. In this case, however, the calculation is way off. Taking I-10 to US-71 (via US-59 & TX-8 inside of Houston for those familiar with the area) is only 166 miles and estimated to take 3 hours 29 minutes according to Google. Likewise, taking US-290 is only 168 miles and estimated to take 3 hours 22 minutes.

Of course these time estimates are usually worst case scenario. Driving a few miles per hour over the speed limit I often make my trip in 2 hours and 30 minutes; worst case has been 3 hours and 10 minutes when driving 55 as an experiment (a painful one at that).

What about the shortest route option in the GPS system? That does actually route you onto I-10 & US-71 in this example, but the shortest route calculations are always incredibly stupid, too. They will often take you onto side streets for half a mile or less just to maintain the shortest possible distance. Once, when driving through Memphis, TN, the GM GPS took us on and off the interstate highway three times when driving through town, often for just a couple of blocks, just to maintain the shortest distance. Granted this is a clear example of a GPS system not being there to replace your own intelligence, but if you don't know the town...

In the early days of consumer-level GPS systems, one of the common problems was having accurate speed data for different road segments. In western states especially, secondary highways often have the same speed limits as interstate highways. In Texas, the past 20 years has seen many of these highways improved so they route around the smaller towns, rather than going through them and stopping at every light. Consequently it is often better to take these roads than the interstates whenever possible. If the GM GPS systems do not have accurate speed data then it can account for some of this behavior, but not all.

On my normal route, once you finally hit TX-71 and the GPS decides you mean it, suddenly the estimated arrival time drops dramatically along with the distance. Is it computing this arrival time based upon your actual speed so far, or based upon the speed data of the road?

Over the years I've gone from absolutely wanting a satnav system in the car to wishing mine didn't. I get much better results using a smart phone with Google Maps to get a general idea of the route to take and then consulting with it now and then if things get tricky. But for the most part, they seem poorly done enough that they just get in the way rather than help. Will the newer generations out now that provide real-time traffic data and have hard-disk based data improve their logic and performance enough that these problems are solved?

One final note for embedded systems developers: you don't get to break the interactive response time rule of 250ms just because you are writing code for an embedded system.

