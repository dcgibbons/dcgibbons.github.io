---
layout: post
title: Rapid Prototyping with MacroFab, Part 2
date: 2016-02-06 20:55:05.000000000 -08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Cars
- Hardware Engineering
- Software Development
- Technology
tags: []
meta:
  _edit_last: '2'
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2016/02/06/rapid-prototyping-with-macrofab-part-2/"
---
As I described in [Part 1](http://chadgibbons.com/2016/02/06/rapid-prototyping-with-macrofab-part-1/), I am using [MacroFab](http://www.macrofab.com/)&nbsp;for rapid prototyping of my [jeepbot](http://chadgibbons.com/2014/01/09/jeep-bot-proof-of-concept-1/) concept project. In this post, I'll describe the next phase of my project and how MacroFab has made it easy to get there.

As I thought about what jeepbot should be, the concept evolved into several different ideas. What I wanted to build first was a control board that directly controlled a simple relay box, like the one described by [Hooz's DIY project](http://www.wranglerforum.com/f202/hoozs-diy-spod-ish-project-1109890.html) post. The idea was to focus on the control circuitry first, rather than the relay circuitry. The control board would replace a bank of switches, so easily plug-and-play. This would allow me to fine-tune the design over time, while retaining a good, simple relay box in the vehicle. I also renamed the project concept **_[switchbot](https://github.com/dcgibbons/switchbot)_** to go with the idea of being vehicle independent.

For my first board, I designed a circuit that contained a Atmel [ATmega328P](http://www.atmel.com/devices/atmega328p.aspx) micro-controller, a [MCP2515](http://www.microchip.com/wwwproducts/devices.aspx?dDocName=en010406) CAN controller, a [MCP2551](http://www.microchip.com/wwwproducts/Devices.aspx?dDocName=en010405) CAN transceiver, and a [74HC595D 8-bit shift register](http://www.ti.com/lit/ds/symlink/sn74hc595.pdf). I only designed in 4 switch circuits for this initial board. Each switch circuit is protected by a [LTV816](https://www.sparkfun.com/datasheets/Components/LTV-8x6.pdf) optocoupler, to isolate the micro-controller's digital logic from the actual switches. These output lines can in turn be used to drive other circuits, such as a relay board.

To round out the board, I added a two-port terminal connector for +12v power and ground, a two-port terminal connector for CAN high and low connections, and a DB9 connector for easily interfacing into automobile OBD-II connectors. I used a 6-port Molex connector for output for power, ground, and the 4 switch channels. A reset button and a 2x3 header for in-system chip programming (ICSP) interface to program&nbsp;the ATmega micro-controller was important to make sure I could download firmware&nbsp;later.

The board also has a simple +12v to +5v power supply regulation circuit and protection diode, but not with significant automotive transient protection. That circuitry will likely be needed in future versions.

You can find the Eagle files for this version of the board on github at&nbsp;[https://github.com/dcgibbons/switchbot/releases/tag/v1.0\_alpha](https://github.com/dcgibbons/switchbot/releases/tag/v1.0_alpha)

Like with my previous board, I used the MacroFab web interface to upload my [Eagle](http://www.cadsoftusa.com) design files. This board had a lot more parts than my previous one, and my experience with the previous board taught me I needed to be more careful in double-checking my part selection. Even with my&nbsp;caution, the engineers at MacroFab found several discrepancies for me to clarify, mostly with resistor values.

While the board was being produced, I discovered the diode value mistake I made with my previous board. I found the same mistake in this board, so I asked MacroFab if it could be replaced - yep! And they did so easily, since this was before assembly of the board had actually begun.

[![IMG_2447]({{ site.baseurl }}/assets/images/IMG_2447-246x300.jpg)](http://chadgibbons.com/wp-content/uploads/2016/02/IMG_2447.jpg)

During the final assembly of the board, MacroFab found the two-port connector parts I selected for my CAN and power interfaces were wrong for my board design. I asked them not to populate those connectors as I had many of the correct ones in my workshop.

MacroFab also found during assembly that the crystal oscillator part I had selected would not &nbsp;match the pins exactly on my board. The size was correct, but the orientation was wrong. I recall that selecting the oscillator part was difficult, so I was not too surprised. A little bit more research from the parts houses and I found what I thought would be a better part. MacroFab agreed and ordered it for me. This extra order only added a couple of days to the overall board assembly time.

[![IMG_2448]({{ site.baseurl }}/assets/images/IMG_2448-300x212.jpg)](http://chadgibbons.com/wp-content/uploads/2016/02/IMG_2448.jpg)A couple of weeks after ordering, my boards arrived. I ordered two of the boards this time, as I wanted to be able to leave one in my [Jeep](http://www.jeep.com/) and use another for bench testing. As soon as they arrived, I hand soldered in the two-port connectors I had (I have a nice supply of them from [SparkFun](https://www.sparkfun.com/products/8432)&nbsp;as they are so commonly used on Arduino-based boards).

The next step was to power up the board and see what happens. No smoke; it lives! Without a program downloaded to the micro-controller nothing much happened, but the solid power-on LED and the all 4 switch LEDs being on indicated to me that the core of the system was alive.

[![IMG_2450]({{ site.baseurl }}/assets/images/IMG_2450-300x225.jpg)](http://chadgibbons.com/wp-content/uploads/2016/02/IMG_2450.jpg)

Next I used an AVR ICSP programmer to download software using the [Arduino](https://www.arduino.cc) IDE, which front-ends the [avrdude](http://www.nongnu.org/avrdude/)&nbsp;tool. I picked the Arduino blink sketch to see if it would download... success! I do not have an LED on pin 13 of the ATmega so I couldn't see the sketch actually running, so next I dowloadeded my _shiftreg_ test sketch. This sketch will cycle through all 4 switches and leave each one active for a few milliseconds. It will also display anything it receives over the CAN bus to its own serial output, although I did not make it easy to show serial output on this board.

[![yqbnj]({{ site.baseurl }}/assets/images/yqbnj.gif)](http://chadgibbons.com/wp-content/uploads/2016/02/yqbnj.gif)

Surprisingly to me, not only did the sketch download, it actually worked. The switch indicator LEDs lit up in turn, and with a meter I could measure the signal voltage on each output line on the Molex connector. Success!

I now have the basis for real hardware testing in my vehicle. I'll post a follow-up on further progress with this project.

The most amazing thing about this experience so far has been the ease of use of the MacroFab interface, their quick turn-around time, and the pricing. For these two boards, the price was approximately $76 each. For a hobbyist, this pricing puts real low-volume projects in easy each. At higher quantities, the price drops dramatically. For 1,000 units, for example, pricing approaches $15 a board for this design.

Stay tuned...

&nbsp;

