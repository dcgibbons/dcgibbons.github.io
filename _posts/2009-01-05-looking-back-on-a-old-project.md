---
title: Looking Back on a Old Project
date: 2009-01-05 00:16:24.000000000 -08:00
type: post
categories: [software development, technology]
tags: [chad, icb, icybee, java, retrospective, review]
author: chadwick
permalink: "/2009/01/05/looking-back-on-a-old-project/"
---
In 2000 I began work on a client application for the
[ICB](http://www.icb.net/) chat system. At the time, the best client for the
system was the old-school UNIX client that worked using a terminal interface.
For things like chat, terminal interfaces are fantastic but at some point they
began to stop keeping pace with the rest of technology. For example, a common
activity in any chat system is the sharing of URLs for other users to view.
Most terminal applications at the time (many of the Linux-based terminal
applications have since improved upon this) did not support this, so users
were forced to cut & paste URLs - not a fun process.

By 2000, I had been developing with [Java](http://www.java.com/) full-time
professionally for just over a year, with exposure to the language off and on
since it was originally released. I wanted to improve upon the existing Java
clients out there, while at the same time making an excuse to learn Java's
Swing API (their new and robust graphical user interface API).

Another key was a Java core technology known as [Java Web
Start](http://java.sun.com/javase/technologies/desktop/javawebstart/index.jsp).
This technology allowed the automatic download, configuration, and updating of
Java _applications_ (versus _applets_) directly from the web. For the users,
this means the application can run locally on their computer without being
stuck inside the web browser only - generally, a very poor performing
approach. For the developer (me!) it meant a more robust run-time environment
with automatic support for browser integration, making it easy to launch URLs
in whatever browser the user has available. This last point was key - with
Java Web Start you don't have to code command-line sequences to launch a
browser, you just use a built-in API and it just happens.

The initial development of my client, which I named
[IcyBee](http://www.nuclearbunny.org/icybee/), took a few months of my spare
time. A small number of users immediately switched to it and began offering
feedback and that, coupled with my own desires, led to several periods of
feature creep over the next few years. Support for graphical emoticons, UTF-7
text encoding (the ICB protocol was designed in '89 and hasn't changed since,
and thus it uses 7-bit US-ASCII only!), and URL shrinking were among the most
notable features added.

The initial development was done using the Java 1.3 platform, but by the time
the most stable version was released in September of '04, Java 1.4 was the
minimum requirement. Until January 3, 2009, version 0.92 remained stable and
under constant use. While the user base is extremely small, any software
product that manages to go over 4 years without a change and still remain
useful day-to-day is impressive to me - even more so given I knew of the warts
and bugs lurking about in the product.

Fast forward to late '08 and the holiday break. I felt like doing some coding
that was not related to work (programmers really do like to code for fun...)
and there were a few bugs in IcyBee that needed fixing. I really had only two
goals for the new version: update the code to use the Java 1.5 platform as a
minimum and fix a few miscellaneous bugs that had never been published in a
version.

Part of converting to the Java 1.5 platform meant changing the code to use the
new coding constructs that were available. This was not necessary, but rather
simplified many parts of the code and allowed me to address several warnings
my editing system. During this conversion process I realized just how much
more I had learned about Java development since the original effort. By
itself, this is no surprise - good engineers of any sort look back on what
they've done and typically think about how they would do it differently (even
it was a smashing success!) based upon what they have learned since then.

Since I originally wrote IcyBee I had been through 3 commercial software
projects that all used Java. One of those was a Swing GUI application, and
clearly I wrote IcyBee's UI before that experience. Another project was a
massive multi-tiered application with a web UI. This project greatly enhanced
my knowledge of design patterns in the Java space. The original coding of
Icybee also took place before I had read the [Effective
Java](http://java.sun.com/docs/books/effective/) book, and few of the
techniques preached by that text were in the project.

Somewhat surprisingly, I am still quite content with the overall design of the
application and its class framework. If I were writing a new chat client
today, even in a different language, I would use the same design pattern
again. This is rather typical of good design patterns - they're applicable to
several different kinds of problems that share common characteristics and tend
to be robust for the long-term.

The Swing UI in IcyBee is the worst part of the application. I had not yet had
vetting experience from my day job in that technology so just getting
something functional was all I was really concerned with. If I were coding
this application today the approach I would take in the UI implementation
would be completely different. The end result for the users would in return be
tighter, faster and more visually appealing. I'd likely even take advantage of
some custom graphic design work and avoid using the rather stale Swing UI
graphics that reeks of circa-2000 computing.

There's a lot left to do to IcyBee to make it "complete" and yet I realized
that's just the perfectionist streak talking. IcyBee has been stable for a
long, long time, and users aren't demanding new features. More spit & polish
would really be for my own benefit and not so much for the users. There is
always the temptation to keep improving upon projects like this given that
they are excellent résumé fodder, but at some point you have to let go and
focus your energies on other things. There are simply other projects with
broader user bases that would be much more beneficial for me to spend my time
on.

On January 3, 2009 I released a new version of IcyBee and labeled it
1.0-stable. The next day I decided to fix another long standing bug with the
URL shortening feature that had been broken because
[TinyURL](http://tinyurl.com/) has started to suck. Luckily, a new service
called [bit.ly](http://bit.ly/) is available and provides a wonderful
REST/JSON API. On January 4, 2009 1.01-stable was released. I hope this
version lasts another 4+ years like 0.92 did.

