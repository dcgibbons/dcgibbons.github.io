---
title: JavaScript Evaluation for Erlang Applications
date: 2013-10-08 13:57:57.000000000 -07:00
type: post
categories: [software development, technology]
tags: [erlang, javascript, json]
author: chadwick
permalink: "/2013/10/08/javascript-evaluation-for-erlang-applications/"
---
If you are an Erlang developer you are likely familiar with the
[Riak](http://basho.com/riak/ "Riak") storage engine, and how the MapReduce
feature can evaluate arbitrary JavaScript expressions. Can you use this same
code to do your own JavaScript evaluations for your Erlang projects? Yes, and
it turns out to be surprisingly easily.

Getting your development environment running `erlang_js` is the first order of
business. I've done all of my testing on a Mac OS X system, both Lion (10.7)
and Mavericks (10.9). I use Erlang `R14B04` for these tests, since that
version is what we primarily target at the office.

If you want to manage multiple versions of Erlang on your OS X system, I
highly recommend the [erlbrew](https://github.com/mrallen1/erlbrew "elbrew")
utility as a quick and easy way to maintain multiple versions. We've recently
made it support R14 builds on OS X Mavericks, so there's no excuse not to use
it!

Assuming you have a working Erlang and OS X command-line development tools
active, execute the following to checkout the `erlang_js` project and build it
locally:

```
git clone git://github.com/basho/erlang\_js.git cd erlang\_js; make all test
```

One of the most compelling uses of a JavaScript engine from another language
like Erlang is the ability to pass arbitrarily deep objects as JSON so they
can be evaluated. This allows your application to use JavaScript as a
general-purpose expression language even if the objects are backed by an
Erlang term. This is effectively what you get with Riak when using the
MapReduce feature.

As an example, let's imagine a deeply nested data structure that represents a
server configuration. We'd like to execute a JavaScript expression against
that data to find the first active network interface. Here's an example of how
you'd do it using `erlang_js`:

```
% Start the erlang\_js application and driver. ok = application:start(erlang\_js). {ok, JSDriver} = js\_driver:new(). % Create a deeply-nested data structure to evaluate ServerObj = {struct, [{\<\<"id"\>\>,\<\<"foobar.example.org"\>\>}, {\<\<"type"\>\>,\<\<"linux"\>\>}, {\<\<"interfaces"\>\>, [ {struct, [ {\<\<"name"\>\>,\<\<"eth0"\>\>}, {\<\<"ipaddress"\>\>,\<\<"192.168.1.101"\>\>}, {\<\<"enabled"\>\>,true}]}, {struct, [{\<\<"name"\>\>,\<\<"eth1"\>\>}, {\<\<"ipaddress"\>\>,\<\<"192.168.1.102"\>\>}, {\<\<"enabled"\>\>,true}]}, {struct, [{\<\<"name"\>\>,\<\<"bridge0"\>\>}, {\<\<"enabled"\>\>,false}]} ]} ]}. % Evaluate our object with an arbitrary JavaScript expression JSFun = \<\<"function is\_any\_interface\_enabled(Server) { for (var i = 0; i \< Server.interfaces.length; i++) { if (Server.interfaces[i].enabled) return true; } return false; }"\>\>. js:call(JSDriver, JSFun, [ServerObj]).
```

The real trick is building your Erlang data structure properly so that the
custom version of `mochijson2` can encode the object as JSON. As you see from
the examples, use tuples with a `struct` atom as the first member to specify
an object. Arrays are just arrays.

I have noticed that it is very easy to confuse a single instance of the
`js_driver` object and it is hosed until a new one is created, so consider
that in how you structure your driver usage.

