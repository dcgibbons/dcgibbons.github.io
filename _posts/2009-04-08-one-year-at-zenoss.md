---
title: One Year at Zenoss
date: 2009-04-08 20:13:31.000000000 -07:00
type: post
categories: [jobs, software development, technology, zenoss]
tags: [agile, coding, python, scrum]
author: chadwick
permalink: "/2009/04/08/one-year-at-zenoss/"
---
Yesterday marked my one-year anniversary at [Zenoss](http://www.zenoss.com/
"Zenoss, Inc. corporate web site"). When I decided to take the job at Zenoss I
knew it would be a challenging position, and time has proven this assumption
correct. The new (to me, anyway) technology, the remote work environment and
the realities of a startup company with limited resources have all added their
own challenges to the job.

I found the Zenoss product itself to be more mature than I had expected. While
it still has plenty of rough edges, especially in the user interface, it is a
rather feature-rich application with a very large user base in both the free
community and paid enterprise versions. There is a tremendous amount of work
left to do on the application, but with each version we see a significant step
forward and an expanded user interest because of the changes.

When I came to Zenoss, my new co-workers and I brought with us a culture of
using agile development methodologies and processes to the company. We
expected, and were asked by company management, to implement those processes
at Zenoss. Over the past year, we have seen the right things happen from this
shift in engineering culture:

- development time has become more predictable
- planning and priority selection take a much more important role than ever before, and not just in engineering (in fact, most importantly not in engineering, but at the executive level)
- quality assurance is now a fundamental part of the engineering process, not a luxury for later
- code and design quality has improved dramatically as the engineering team begins to understand how much control they really do have over the process

There still remain many challenges, but these are the same ones I have seen
with all teams that struggle with the discipline needed for agile
methodologies. Effectively breaking down large development tasks into two-week
iterations remains a hurdle; I suspect at a fundamental level many of the
developers do not fully believe this is possible, which is a long, long
discussion. There was also a reluctance, until recently, to fully engage with
teammates on performing effective code and design reviews. These will both
improve over time as the team matures.

When I first started at Zenoss there were 5 developers in Annapolis, 2
developers in Austin and me , usually working remote in Houston. Since then,
the team dynamics have changed so that I and one other developer are remote
most of the time, 3 developers are full-time in Austin and 1 in Annapolis.
This team dynamic change has made the infrastructure needed to support remote
development much more important, but at the same time it has made the remote
developers somewhat more isolated since a bit more now happens only in one
location. Since I travel to Austin frequently I can avoid the worst of this
unavoidable trend, but it will likely always remain a challenge as long as we
have remote employees.

On a personal level, working remotely full-time for this long has been much
more difficult than I expected. I last did this much remote work in the
mid-90s, and it was difficult to do then, as well. On the surface, I spend all
of my work hours focused on some problem on the computer, but in reality much
of my job is very social and without face time it starts to wear on me very
quickly. Frequent visits to Austin help tremendously, but in reality this will
likely always be an issue until I relocate.

I've encountered almost all of the traditional problems people have while
working at home, but especially keeping focus and balancing the time spent
between work and home life. Focus is purely a self-discipline issue, but it is
remarkable how much of this is provided by the routine of commuting to an
office. Maintaining a good work-life balance is also tremendously hard when
working at home, unless you dedicate a specific place in the house for work.
It took a few months to really learn this lesson but eventually I bought a
second desk and made myself an office separate from my normal home office.
Before then, I found it way too easy to bring my laptop into the living room
and I'd continue to check e-mail and work on problems throughout the evening.
Sometimes, I still do, but not at least it is not a mindless&nbsp;occurrence.

Zenoss is a very small company, and naturally we have very limited resources.
Of course, today's economic environment makes this true for almost every
single company. But more specifically, I find ourselves working around what
effectively is a lack of resources in our IT department. I often have to build
my own virtual machines at home, or buy little widgets to help productivity
because I am remote. At some level, I don't mind this, since it's nice being
able to actually work somewhere you _can_ do this, rather than being told you
can't.

After a year, I'm still not a huge fan of the [Python](http://www.python.org/)
programming language, but I've come to accept it and I can be productive with
it. Working with it feels a whole lot like I stepped back in time 15 years,
and saying that is a great way to start an argument, so I'll just leave it at
that.

One great surprise from the past year is that I became the guru for Zenoss's
Windows monitoring technology. We have a custom implementation of
[MS-RPC](http://en.wikipedia.org/wiki/MSRPC) that is based upon the [Samba
4](http://wiki.samba.org/index.php/Samba4) source tree. On top of this layer,
we have provided our own implementations of the
[DCOM](http://msdn.microsoft.com/en-us/library/ms809340.aspx),
[WMI](http://msdn.microsoft.com/en-us/library/ms809340.aspx), and [Windows
registry](http://msdn.microsoft.com/en-us/library/ms809340.aspx) interfaces so
we can call these services directly on any Windows device. This is a great
feature, as it allows us to communicate directly to Windows devices from our
Linux based product, without requiring a Windows device to be running our
software just to provide Windows-based connectivity, unlike some other systems
management products.

Over the next few months I will be taking on more and more of the
implementation of the new Zenoss user interface, which is a great project that
should dramatically improve the user acceptance of quality of the application.
It also gives me more time to work on user interfaces, which is always an area
of software development I enjoy but rarely get a chance to do.

