---
layout: post
title: 'Jeep Bot - Proof of Concept #1'
date: 2014-01-09 21:17:10.000000000 -08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Cars
- Software Development
- Technology
tags:
- automotive
- auxiliary
- can
- can-bus
- car
- hacking
- Jeep
- relay
- switches
- wrangler
meta:
  _oembed_time_e3d6027519e45fc1cd66ef6917cfccdb: '1418578797'
  _oembed_e3d6027519e45fc1cd66ef6917cfccdb: <iframe width="474" height="356" src="http://www.youtube.com/embed/v64EYqzys0Q?feature=oembed"
    frameborder="0" allowfullscreen></iframe>
  _edit_last: '1'
  _oembed_837c83ed96a53c8d41e7731c121b9c64: <iframe width="584" height="438" src="http://www.youtube.com/embed/v64EYqzys0Q?feature=oembed"
    frameborder="0" allowfullscreen></iframe>
  _oembed_8bdc9776c0edb600eaa50ee76e5463f3: <iframe width="660" height="495" src="http://www.youtube.com/embed/v64EYqzys0Q?feature=oembed"
    frameborder="0" allowfullscreen></iframe>
  _oembed_time_8bdc9776c0edb600eaa50ee76e5463f3: '1419874432'
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2014/01/09/jeep-bot-proof-of-concept-1/"
---
I finished the 1st proof-of-concept for using the CAN-Bus data to control auxiliary relays. It worked great. Attached is a block diagram of what I used, and a longish video of how the testing went.

[caption id="" align="alignnone" width="401"] ![]({{ site.baseurl }}/assets/images/11862587196_970d32ff8e.jpg) Jeep Bot Block Diagram[/caption]

&nbsp;

If you want to skip all the bench testing, the actual in-car testing happens at the 11:15 mark of the video.

http://www.youtube.com/watch?v=v64EYqzys0Q

Code for the demo can be found at&nbsp;[https://github.com/dcgibbons/jeepbot/tree/poc1](https://github.com/dcgibbons/jeepbot/tree/poc1 "https://github.com/dcgibbons/jeepbot/tree/poc1")

A few hours after I finished, a bluetooth-low-energy board I ordered showed up. The next step will be to throw that on there so that I can use the smartphone to configure each switch and optionally control them by hand.

Each switch will have the following different possible control states:

- always on
- manual only
- on when interior lights are on
- on when high-beams are on

Right after that, I'll start working on a prototype PCB and housing so I can start testing real versions of this system.

I'll post the design, schematics and code in progress on my blog so anyone can offer feedback as it gets built.

