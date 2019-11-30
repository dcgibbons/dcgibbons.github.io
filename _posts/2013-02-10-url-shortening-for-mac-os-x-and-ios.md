---
layout: post
title: URL Shortening for Mac OS X and iOS
date: 2013-02-10 22:04:06.000000000 -08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Software Development
- Technology
tags:
- iOS
- Mac OS X
- objective-c
- xcode
meta:
  _edit_last: '1'
  wp-syntax-cache-content: "a:1:{i:1;s:2863:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"objc\" style=\"font-family:monospace;\"><span style=\"color:
    #a61390;\">@interface</span> MyController <span style=\"color: #002200;\">:</span>
    <span style=\"color: #400080;\">NSObject</span>\n<span style=\"color: #a61390;\">@end</span>\n&nbsp;\n<span
    style=\"color: #a61390;\">@implementation</span> MyController\n&nbsp;\n<span style=\"color:
    #002200;\">-</span> <span style=\"color: #002200;\">&#40;</span><span style=\"color:
    #a61390;\">void</span><span style=\"color: #002200;\">&#41;</span>doSomethingAwesome\n<span
    style=\"color: #002200;\">&#123;</span>\n    <span style=\"color: #a61390;\">const</span>
    URLShortener <span style=\"color: #002200;\">*</span>shortener <span style=\"color:
    #002200;\">=</span> <span style=\"color: #002200;\">&#91;</span>URLShortener defaultURLShortener<span
    style=\"color: #002200;\">&#93;</span>;\n&nbsp;\n    <span style=\"color: #a61390;\">const</span>
    <span style=\"color: #400080;\">NSString</span> <span style=\"color: #002200;\">*</span>text
    <span style=\"color: #002200;\">=</span> <span style=\"color: #bf1d1a;\">@</span><span
    style=\"color: #bf1d1a;\">&quot;hello, this is cool: http://newoldage.blogs.nytimes.com/2013/02/01/caregiving-laced-with-humor/?hp
    but this one isn't that cool http://religion.blogs.cnn.com/2013/01/29/poll-quarter-of-americans-say-god-influences-sporting-events/&quot;</span>;\n&nbsp;\n
    \   <span style=\"color: #002200;\">&#91;</span>shortener shortenTextWithURLs<span
    style=\"color: #002200;\">:</span>text observer<span style=\"color: #002200;\">:</span>self<span
    style=\"color: #002200;\">&#93;</span>;\n<span style=\"color: #002200;\">&#125;</span>\n&nbsp;\n<span
    style=\"color: #002200;\">-</span> <span style=\"color: #002200;\">&#40;</span><span
    style=\"color: #a61390;\">void</span><span style=\"color: #002200;\">&#41;</span>textWithURLsShortened<span
    style=\"color: #002200;\">:</span><span style=\"color: #002200;\">&#40;</span><span
    style=\"color: #400080;\">NSString</span> <span style=\"color: #002200;\">*</span><span
    style=\"color: #002200;\">&#41;</span>text\n<span style=\"color: #002200;\">&#123;</span>\n
    \   ...\n<span style=\"color: #002200;\">&#125;</span>\n&nbsp;\n<span style=\"color:
    #a61390;\">@end</span></pre></td></tr></table><p class=\"theCode\" style=\"display:none;\">@interface
    MyController : NSObject\r\n@end\r\n\r\n@implementation MyController\r\n\r\n- (void)doSomethingAwesome\r\n{\r\n
    \   const URLShortener *shortener = [URLShortener defaultURLShortener];\r\n\r\n
    \   const NSString *text = @&quot;hello, this is cool: http://newoldage.blogs.nytimes.com/2013/02/01/caregiving-laced-with-humor/?hp
    but this one isn't that cool http://religion.blogs.cnn.com/2013/01/29/poll-quarter-of-americans-say-god-influences-sporting-events/&quot;;\r\n\r\n
    \   [shortener shortenTextWithURLs:text observer:self];\r\n}\r\n\r\n- (void)textWithURLsShortened:(NSString
    *)text\r\n{\r\n    ...\r\n}\r\n\r\n@end</p></div>\n\";}"
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2013/02/10/url-shortening-for-mac-os-x-and-ios/"
---
Today I'm releasing version 1.0.0 of URLKit, a library to find and shorten URLs for Mac OS X and iOS applications.

URLKit was written to order to provide URL shortening services to messaging applications where users may be providing multiple URLs in a single input buffer. I needed the ability to shorten multiple URLs at once and to do so without slowing down the main user interface.

URLKit is implemented using Grand Central Dispatch's operation queues, so your main UI queue is never blocked by URL shortening operations.

Using URLKit is easy:

```
@interface MyController : NSObject @end @implementation MyController - (void)doSomethingAwesome { const URLShortener \*shortener = [URLShortener defaultURLShortener]; const NSString \*text = @"hello, this is cool: http://newoldage.blogs.nytimes.com/2013/02/01/caregiving-laced-with-humor/?hp but this one isn't that cool http://religion.blogs.cnn.com/2013/01/29/poll-quarter-of-americans-say-god-influences-sporting-events/"; [shortener shortenTextWithURLs:text observer:self]; } - (void)textWithURLsShortened:(NSString \*)text { ... } @end
```

URLKit can be found at [https://github.com/dcgibbons/URLKit](https://github.com/dcgibbons/URLKit "URLKit GitHub Project") and is licensed using the Apache 2.0 license. Comments and patches are welcome!

