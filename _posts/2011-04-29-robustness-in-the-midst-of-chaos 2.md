---
layout: post
title: Robustness in the Midst of Chaos
date: 2011-04-29 11:50:17.000000000 -07:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Software Development
- Technology
tags:
- chaos
- cloud
- linkedin
- netflix
- scale
meta:
  _edit_last: '2'
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2011/04/29/robustness-in-the-midst-of-chaos/"
---
I've been catching up on technology news this week, after a few months of completely ignoring it. One of my favorites so far has been Netflix's brief post on [5 Lessons We've Learned Using AWS](http://techblog.netflix.com/2010/12/5-lessons-weve-learned-using-aws.html). Within, they discuss the importance of testing your systems ability to survive failure in a infrastructure that is inherently chaotic and prone to failure (a fundamental characteristic of massively scalable clouds).

One way Netflix has tested their ability to survive failure is to constantly _force_ failure within their system. They built a system component named ChaosMonkey that randomly kills part of their architecture to ensure that the rest of it can survive and continuing offering service to customers. I love this approach. Not only does it show a lot of maturity within the Netflix engineering team about what systems failure really means, but also shows that they understand the importance of constantly ensuring that failures are expected and recoverable; I still see too many enterprises today that have yet to learn that important lesson.

ChaosMonkey reminds me greatly of what I used to do, albeit manually, when I was in charge of systems architecture at a company in the early a part of my career. We had a wonderfully horizontally scalable system architecture, back in an era when most enterprises would only use mainframes for systems of such size and importance. It was a critical part of our ability to provide high levels of service and performance at a relatively low cost. We did a good job of giving our operations team plenty of opportunity to test system failure and ensure that we could survive catastrophic failure, but I found it was never quite enough as the system grew more complex.

About the time we began implementing RAID drive subsystems for our database nodes, I began a systematic approach to destroy parts of our architecture on a regular basis. At first, it was a way to make sure the RAID subsystem would act appropriately in a degraded state - and they did, but we had plenty of software modifications to make to allow our systems to perform better in such a state. My experiments quickly became a little more aggressive... a few times a week, I would randomly pull drives out of their carriers, or kill processes on production nodes, or even cause an entire system crash.

Remarkably, it was rare when any of this activity would even be noticed. Our architecture was so good at surviving single points of failure that the operations team would often not even notice that anything at all had happened. When they did, it was usually a sign of a weak-point in our architecture that needed to be fixed. Occasionally, hardware actually failed from my little experiments, and I always felt bad about that, but the reality is that same hardware would have failed at a much more inconvenient time.

Alas, once our company was purchased by a publicly-traded company, development was no longer allowed access to the data center. For the most part, this was a very positive thing, but it also prevented people like myself from twiddling with the system to make sure it would work well. Our operations staff was good however, and many of the lessons development learned over the years were picked up by them. Today's trend of dev-ops is a welcome return to some of that way of thinking, as it really does show that you need developer mindsets when running your operations.

I can distill my experiences doing dev-ops work in the past into some key points:

1. Build your systems with the assumption that failure happens, and happens regularly. 
2. You must test your ability to fail and recover, and do it constantly. 
3. Hardware & software solutions for vertical scaling are inherently inflexible and likely much more expensive in the long run. This was true in the 1980s, and even more true today now that more shops understand the nature of horizontal scalability. 
4. Beware of the mindset that wants high uptime for individual systems. It's cool for your server at home, but in an operations scenario that system represents one that might not startup properly if it does fail. Inability for a system to startup properly was, and remains, a hugely common problem. Reboot all of your systems regularly.
