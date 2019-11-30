---
layout: post
title: JavaScript Evaluation for Erlang Applications
date: 2013-10-08 13:57:57.000000000 -07:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Software Development
- Technology
tags:
- erlang
- javascript
- json
meta:
  _edit_last: '1'
  wp-syntax-cache-content: "a:2:{i:1;s:355:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"shell\" style=\"font-family:monospace;\">git clone
    git://github.com/basho/erlang_js.git\r\ncd erlang_js; make all test</pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">git clone git://github.com/basho/erlang_js.git\r\ncd
    erlang_js; make all test</p></div>\n\";i:2;s:10707:\"\n<div class=\"wp_syntax\"
    style=\"position:relative;\"><table><tr><td class=\"code\"><pre class=\"erlang\"
    style=\"font-family:monospace;\"><span style=\"color: #666666; font-style: italic;\">%
    Start the erlang_js application and driver.</span>\nok <span style=\"color: #014ea4;\">=</span>
    <span style=\"color: #ff4e18;\">application</span>:<span style=\"color: #ff3c00;\">start</span><span
    style=\"color: #109ab8;\">&#40;</span>erlang_js<span style=\"color: #109ab8;\">&#41;</span><span
    style=\"color: #6bb810;\">.</span>\n<span style=\"color: #109ab8;\">&#123;</span>ok<span
    style=\"color: #6bb810;\">,</span> <span style=\"color: #45b3e6;\">JSDriver</span><span
    style=\"color: #109ab8;\">&#125;</span> <span style=\"color: #014ea4;\">=</span>
    js_driver:<span style=\"color: #ff3c00;\">new</span><span style=\"color: #109ab8;\">&#40;</span><span
    style=\"color: #109ab8;\">&#41;</span><span style=\"color: #6bb810;\">.</span>\n&nbsp;\n<span
    style=\"color: #666666; font-style: italic;\">% Create a deeply-nested data structure
    to evaluate</span>\n<span style=\"color: #45b3e6;\">ServerObj</span> <span style=\"color:
    #014ea4;\">=</span> <span style=\"color: #109ab8;\">&#123;</span>struct<span style=\"color:
    #6bb810;\">,</span> <span style=\"color: #109ab8;\">&#91;</span>\n    <span style=\"color:
    #109ab8;\">&#123;</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;id&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;,</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #ff7800;\">&quot;foobar.example.org&quot;</span>&amp;gt<span style=\"color:
    #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #109ab8;\">&#125;</span><span style=\"color: #6bb810;\">,</span>\n    <span style=\"color:
    #109ab8;\">&#123;</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;type&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;,</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #ff7800;\">&quot;linux&quot;</span>&amp;gt<span style=\"color:
    #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #109ab8;\">&#125;</span><span style=\"color: #6bb810;\">,</span>\n    <span style=\"color:
    #109ab8;\">&#123;</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;interfaces&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;,</span>
    <span style=\"color: #109ab8;\">&#91;</span>\n        <span style=\"color: #109ab8;\">&#123;</span>struct<span
    style=\"color: #6bb810;\">,</span> <span style=\"color: #109ab8;\">&#91;</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;name&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;eth0&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #109ab8;\">&#125;</span><span style=\"color: #6bb810;\">,</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;ipaddress&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;192.168.1.101&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #109ab8;\">&#125;</span><span style=\"color: #6bb810;\">,</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;enabled&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>true<span style=\"color: #109ab8;\">&#125;</span>\n
    \       <span style=\"color: #109ab8;\">&#93;</span><span style=\"color: #109ab8;\">&#125;</span><span
    style=\"color: #6bb810;\">,</span>\n        <span style=\"color: #109ab8;\">&#123;</span>struct<span
    style=\"color: #6bb810;\">,</span> <span style=\"color: #109ab8;\">&#91;</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;name&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;eth1&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #109ab8;\">&#125;</span><span style=\"color: #6bb810;\">,</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;ipaddress&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;192.168.1.102&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #109ab8;\">&#125;</span><span style=\"color: #6bb810;\">,</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;enabled&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>true<span style=\"color: #109ab8;\">&#125;</span>\n
    \       <span style=\"color: #109ab8;\">&#93;</span><span style=\"color: #109ab8;\">&#125;</span><span
    style=\"color: #6bb810;\">,</span>\n        <span style=\"color: #109ab8;\">&#123;</span>struct<span
    style=\"color: #6bb810;\">,</span> <span style=\"color: #109ab8;\">&#91;</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;name&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>&amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span
    style=\"color: #6bb810;\">;</span><span style=\"color: #ff7800;\">&quot;bridge0&quot;</span>&amp;gt<span
    style=\"color: #6bb810;\">;</span>&amp;gt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #109ab8;\">&#125;</span><span style=\"color: #6bb810;\">,</span>\n
    \           <span style=\"color: #109ab8;\">&#123;</span>&amp;lt<span style=\"color:
    #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span style=\"color:
    #ff7800;\">&quot;enabled&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;,</span>false<span style=\"color: #109ab8;\">&#125;</span>\n
    \       <span style=\"color: #109ab8;\">&#93;</span><span style=\"color: #109ab8;\">&#125;</span>\n
    \   <span style=\"color: #109ab8;\">&#93;</span><span style=\"color: #109ab8;\">&#125;</span>\n<span
    style=\"color: #109ab8;\">&#93;</span><span style=\"color: #109ab8;\">&#125;</span><span
    style=\"color: #6bb810;\">.</span>\n&nbsp;\n<span style=\"color: #666666; font-style:
    italic;\">% Evaluate our object with an arbitrary JavaScript expression</span>\n<span
    style=\"color: #45b3e6;\">JSFun</span> <span style=\"color: #014ea4;\">=</span>
    &amp;lt<span style=\"color: #6bb810;\">;</span>&amp;lt<span style=\"color: #6bb810;\">;</span><span
    style=\"color: #ff7800;\">&quot;function is_any_interface_enabled(Server) { for
    (var i = 0; i &amp;lt; Server.interfaces.length; i++) { if (Server.interfaces[i].enabled)
    return true; } return false; }&quot;</span>&amp;gt<span style=\"color: #6bb810;\">;</span>&amp;gt<span
    style=\"color: #6bb810;\">;.</span>\n&nbsp;\njs:<span style=\"color: #ff3c00;\">call</span><span
    style=\"color: #109ab8;\">&#40;</span><span style=\"color: #45b3e6;\">JSDriver</span><span
    style=\"color: #6bb810;\">,</span> <span style=\"color: #45b3e6;\">JSFun</span><span
    style=\"color: #6bb810;\">,</span> <span style=\"color: #109ab8;\">&#91;</span><span
    style=\"color: #45b3e6;\">ServerObj</span><span style=\"color: #109ab8;\">&#93;</span><span
    style=\"color: #109ab8;\">&#41;</span><span style=\"color: #6bb810;\">.</span></pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">% Start the erlang_js application and
    driver.\r\nok = application:start(erlang_js).\r\n{ok, JSDriver} = js_driver:new().\r\n\r\n%
    Create a deeply-nested data structure to evaluate\r\nServerObj = {struct, [\r\n
    \   {&amp;lt;&amp;lt;&quot;id&quot;&amp;gt;&amp;gt;,&amp;lt;&amp;lt;&quot;foobar.example.org&quot;&amp;gt;&amp;gt;},\r\n
    \   {&amp;lt;&amp;lt;&quot;type&quot;&amp;gt;&amp;gt;,&amp;lt;&amp;lt;&quot;linux&quot;&amp;gt;&amp;gt;},\r\n
    \   {&amp;lt;&amp;lt;&quot;interfaces&quot;&amp;gt;&amp;gt;, [\r\n        {struct,
    [\r\n            {&amp;lt;&amp;lt;&quot;name&quot;&amp;gt;&amp;gt;,&amp;lt;&amp;lt;&quot;eth0&quot;&amp;gt;&amp;gt;},\r\n
    \           {&amp;lt;&amp;lt;&quot;ipaddress&quot;&amp;gt;&amp;gt;,&amp;lt;&amp;lt;&quot;192.168.1.101&quot;&amp;gt;&amp;gt;},\r\n
    \           {&amp;lt;&amp;lt;&quot;enabled&quot;&amp;gt;&amp;gt;,true}\r\n        ]},\r\n
    \       {struct, [\r\n            {&amp;lt;&amp;lt;&quot;name&quot;&amp;gt;&amp;gt;,&amp;lt;&amp;lt;&quot;eth1&quot;&amp;gt;&amp;gt;},\r\n
    \           {&amp;lt;&amp;lt;&quot;ipaddress&quot;&amp;gt;&amp;gt;,&amp;lt;&amp;lt;&quot;192.168.1.102&quot;&amp;gt;&amp;gt;},\r\n
    \           {&amp;lt;&amp;lt;&quot;enabled&quot;&amp;gt;&amp;gt;,true}\r\n        ]},\r\n
    \       {struct, [\r\n            {&amp;lt;&amp;lt;&quot;name&quot;&amp;gt;&amp;gt;,&amp;lt;&amp;lt;&quot;bridge0&quot;&amp;gt;&amp;gt;},\r\n
    \           {&amp;lt;&amp;lt;&quot;enabled&quot;&amp;gt;&amp;gt;,false}\r\n        ]}\r\n
    \   ]}\r\n]}.\r\n\r\n% Evaluate our object with an arbitrary JavaScript expression\r\nJSFun
    = &amp;lt;&amp;lt;&quot;function is_any_interface_enabled(Server) { for (var i
    = 0; i &amp;lt; Server.interfaces.length; i++) { if (Server.interfaces[i].enabled)
    return true; } return false; }&quot;&amp;gt;&amp;gt;.\r\n\r\njs:call(JSDriver,
    JSFun, [ServerObj]).</p></div>\n\";}"
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2013/10/08/javascript-evaluation-for-erlang-applications/"
---
If you are an Erlang developer you are likely familiar with the [Riak](http://basho.com/riak/ "Riak") storage engine, and how the MapReduce feature can evaluate arbitrary JavaScript expressions. Can you use this same code to do your own JavaScript evaluations for your Erlang projects? Yes, and it turns out to be surprisingly easily.

Getting your development environment running `erlang_js` is the first order of business. I've done all of my testing on a Mac OS X system, both Lion (10.7) and Mavericks (10.9). I use Erlang `R14B04` for these tests, since that version is what we primarily target at the office.

If you want to manage multiple versions of Erlang on your OS X system, I highly recommend the [erlbrew](https://github.com/mrallen1/erlbrew "elbrew") utility as a quick and easy way to maintain multiple versions. We've recently made it support R14 builds on OS X Mavericks, so there's no excuse not to use it!

Assuming you have a working Erlang and OS X command-line development tools active, execute the following to checkout the `erlang_js` project and build it locally:

```
git clone git://github.com/basho/erlang\_js.git cd erlang\_js; make all test
```

One of the most compelling uses of a JavaScript engine from another language like Erlang is the ability to pass arbitrarily deep objects as JSON so they can be evaluated. This allows your application to use JavaScript as a general-purpose expression language even if the objects are backed by an Erlang term. This is effectively what you get with Riak when using the MapReduce feature.

As an example, let's imagine a deeply nested data structure that represents a server configuration. We'd like to execute a JavaScript expression against that data to find the first active network interface. Here's an example of how you'd do it using `erlang_js`:

```
% Start the erlang\_js application and driver. ok = application:start(erlang\_js). {ok, JSDriver} = js\_driver:new(). % Create a deeply-nested data structure to evaluate ServerObj = {struct, [{\<\<"id"\>\>,\<\<"foobar.example.org"\>\>}, {\<\<"type"\>\>,\<\<"linux"\>\>}, {\<\<"interfaces"\>\>, [ {struct, [ {\<\<"name"\>\>,\<\<"eth0"\>\>}, {\<\<"ipaddress"\>\>,\<\<"192.168.1.101"\>\>}, {\<\<"enabled"\>\>,true}]}, {struct, [{\<\<"name"\>\>,\<\<"eth1"\>\>}, {\<\<"ipaddress"\>\>,\<\<"192.168.1.102"\>\>}, {\<\<"enabled"\>\>,true}]}, {struct, [{\<\<"name"\>\>,\<\<"bridge0"\>\>}, {\<\<"enabled"\>\>,false}]} ]} ]}. % Evaluate our object with an arbitrary JavaScript expression JSFun = \<\<"function is\_any\_interface\_enabled(Server) { for (var i = 0; i \< Server.interfaces.length; i++) { if (Server.interfaces[i].enabled) return true; } return false; }"\>\>. js:call(JSDriver, JSFun, [ServerObj]).
```

The real trick is building your Erlang data structure properly so that the custom version of `mochijson2` can encode the object as JSON. As you see from the examples, use tuples with a `struct` atom as the first member to specify an object. Arrays are just arrays.

I have noticed that it is very easy to confuse a single instance of the `js_driver` object and it is hosed until a new one is created, so consider that in how you structure your driver usage.

&nbsp;

