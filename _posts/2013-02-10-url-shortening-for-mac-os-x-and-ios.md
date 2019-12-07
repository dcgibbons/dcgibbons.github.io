---
title: URL Shortening for Mac OS X and iOS
date: 2013-02-10 22:04:06.000000000 -08:00
type: post
categories: [software development, technology]
tags: [iOS, Mac OS X, objc, objective-c, xcode]
author: chadwick
permalink: "/2013/02/10/url-shortening-for-mac-os-x-and-ios/"
---
Today I'm releasing version 1.0.0 of URLKit, a library to find and shorten
URLs for Mac OS X and iOS applications.

URLKit was written to order to provide URL shortening services to messaging
applications where users may be providing multiple URLs in a single input
buffer. I needed the ability to shorten multiple URLs at once and to do so
without slowing down the main user interface.

URLKit is implemented using Grand Central Dispatch's operation queues, so your
main UI queue is never blocked by URL shortening operations.

Using URLKit is easy:

```
@interface MyController : NSObject 
@end 

@implementation MyController 

- (void)doSomethingAwesome { 
  const URLShortener \*shortener = [URLShortener defaultURLShortener]; 
  const NSString \*text = @"hello, this is cool: http://newoldage.blogs.nytimes.com/2013/02/01/caregiving-laced-with-humor/?hp but this one isn't that cool http://religion.blogs.cnn.com/2013/01/29/poll-quarter-of-americans-say-god-influences-sporting-events/"; [shortener shortenTextWithURLs:text observer:self]; 
} 

- (void)textWithURLsShortened:(NSString \*)text { ... } 

@end
```

URLKit can be found at
[https://github.com/dcgibbons/URLKit](https://github.com/dcgibbons/URLKit
"URLKit GitHub Project") and is licensed using the Apache 2.0 license.
Comments and patches are welcome!

