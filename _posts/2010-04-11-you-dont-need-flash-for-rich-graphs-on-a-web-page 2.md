---
layout: post
title: You Don't Need Flash for Rich Graphs on a Web Page
date: 2010-04-11 15:35:33.000000000 -07:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Jobs
- Software Development
- Technology
- Zenoss
tags:
- flash
- graphs
- html5
- linkedin
- ria
meta:
  _edit_last: '2'
  wp-syntax-cache-content: "a:1:{i:1;s:1106:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"html\" style=\"font-family:monospace;\">&lt;!DOCTYPE
    html&gt;\r\n&lt;html lang=&quot;en&quot;&gt;\r\n  &lt;head&gt;\r\n    &lt;title&gt;Rich
    Graph Example using HTML5's Canvas Element&lt;/title&gt;\r\n  &lt;/head&gt;\r\n
    \ &lt;body&gt;\r\n    &lt;h1&gt;Rich Graph Example using HTML5's Canvas Element&lt;/h1&gt;\r\n
    \   &lt;canvas id=&quot;graph1&quot; width=&quot;500&quot; height=&quot;200&quot;&gt;\r\n
    \     This text is displayed if your browser sucks.\r\n    &lt;/canvas&gt;\r\n
    \ &lt;/body&gt;\r\n&lt;/html&gt;</pre></td></tr></table><p class=\"theCode\" style=\"display:none;\">&lt;!DOCTYPE
    html&gt;\r\n&lt;html lang=&quot;en&quot;&gt;\r\n  &lt;head&gt;\r\n    &lt;title&gt;Rich
    Graph Example using HTML5's Canvas Element&lt;/title&gt;\r\n  &lt;/head&gt;\r\n
    \ &lt;body&gt;\r\n    &lt;h1&gt;Rich Graph Example using HTML5's Canvas Element&lt;/h1&gt;\r\n
    \   &lt;canvas id=&quot;graph1&quot; width=&quot;500&quot; height=&quot;200&quot;&gt;\r\n
    \     This text is displayed if your browser sucks.\r\n    &lt;/canvas&gt;\r\n
    \ &lt;/body&gt;\r\n&lt;/html&gt;</p></div>\n\";}"
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2010/04/11/you-dont-need-flash-for-rich-graphs-on-a-web-page/"
---
[Adobe's Flash](http://www.adobe.com/flashplatform/) has a lot of uses, but one of the most impressive to me has been the the creation of interactive graphs on a web page. One just has to visit [Google Finance](http://www.google.com/finance?q=NASDAQ:GOOG) to see a great example of this in action; it's fast, effective and fits seemlessly within the rest of the page.

Many times, however, Flash isn't an appropriate technology to use. If you're an open-source product like Zenoss, Flash presents a licensing issue. If you're targeting mobile platforms like the [iPhone](http://www.apple.com/iphone/), Flash isn't available. And, sometimes, you may just not like Flash; it does have it's own security problems and overhead, for example. What's a web developer to do? Enter HTML5 to the rescue...

[HTML5](http://en.wikipedia.org/wiki/Html5) is not yet an approved standard, but it's well on its way and surprisingly well-supported by the browser community already. One of the nice new features provided in HTML5 is the [canvas element](http://en.wikipedia.org/wiki/Canvas_element) which allows for two-dimensional drawing functionality. Between this new feature and JavaScript, we should be able to create a rich graph display.

<!--nextpage-->  
To get started, we'll first need to create an HTML document that has the structure we're after and a place for our drawing canvas to reside.

```
<title>Rich Graph Example using HTML5's Canvas Element</title>
# Rich Graph Example using HTML5's Canvas Element
<canvas id="graph1" width="500" height="200">
      This text is displayed if your browser sucks.
    </canvas>
```

<!--nextpage-->  
Next, we'll need some JavaScript to do the work of creating the actual graph display. First, we'll need to get a reference to the canvas DOM element and then ask it for it's 2D drawing context:

```
var graph1 = document.getElementById('graph1'); var context = graph1.getContext('2d');
```

Next, we'll need to define the raw data used to display the graph. We're going to assume a set of CPU processor time measurements with 5-minute measurement intervals, much like you would see in [Zenoss](http://www.zenoss.com/) or other systems management application.

```
// Raw data, such as what might come back from a server query. data = [{ value: 9.9430, time: new Date(2010, 4, 9, 7, 50, 0, 0) }, { value: 0.0000, time: new Date(2010, 4, 9, 7, 55, 0, 0) }, { value: 0.0000, time: new Date(2010, 4, 9, 8, 00, 0, 0) }, { value: 0.0000, time: new Date(2010, 4, 9, 8, 05, 0, 0) }, { value: 5.5828, time: new Date(2010, 4, 9, 8, 10, 0, 0) }, { value: 1.0000, time: new Date(2010, 4, 9, 8, 15, 0, 0) }, { value: 25.3120, time: new Date(2010, 4, 9, 8, 20, 0, 0) }, { value: 45.8210, time: new Date(2010, 4, 9, 8, 25, 0, 0) }, { value: 98.3211, time: new Date(2010, 4, 9, 8, 30, 0, 0) }, { value: 96.1290, time: new Date(2010, 4, 9, 8, 35, 0, 0) }, { value: 94.9128, time: new Date(2010, 4, 9, 8, 40, 0, 0) }, { value: 98.3219, time: new Date(2010, 4, 9, 8, 45, 0, 0) }, { value: 32.4912, time: new Date(2010, 4, 9, 8, 50, 0, 0) },]; // Calculate the maximums in the provided data. var maxY = 0.0; for (var i = 0; i \< data.length; i++) { maxY = Math.max(data[i].value, maxY); } var dataMaxY = Math.ceil(maxY); var dataMaxX = data.length;
```

<!--nextpage-->  
Now, we have to calculate where we can start drawing on the canvas and how many pixels equal one coordinate in our user space data. The more elaborate legends we'll want to use on the graph, the more these calculations will matter as we leave space for drawing text around the actual graph.

```
// define a font to use for legends var fontHeight = 20; var font = "12px/20px arial, sans-serif"; var xStart = 0; var yStart = fontHeight \* 2; // leave room for 2 lines of text at the bottom var xEnd = graph1.width; var yEnd = graph1.height; // Determine how many pixel units equal one user space coordinate. var xStep = dataMaxX / (xEnd - xStart); var yStep = dataMaxY / (yEnd - yStart); // Create an array of 2D points to represent the user space // coordinates of each data item. points = new Array(data.length); for (var i = 0; i \< data.length; i++) { var x = i / xStep + xStart; var y = data[i].value / yStep + yStart; points[i] = { x: x, y: y }; }
```

Now we get to the actual drawing of the graph. This is straight-forward 2D drawing that should be familiar to anyone who has done it with other technology.

```
// Save the graphics context before we begin mucking with it. context.save(); // Create a transform so that the graph portion of the chart can be // drawn using a bottom-left origin instead of the default upper-left. context.translate(0, yEnd); context.scale(1.0, -1.0); // Draw our path using the appropriate color. context.beginPath(); context.strokeStyle = 'black'; context.lineWidth = 5; context.moveTo(points[0].x, points[0].y); for (var i = 1; i \< points.length; i++) { context.lineTo(points[i].x, points[i].y); } context.stroke(); context.restore();
```

<!--nextpage-->  
At this stage, we can render a simple line-graph using JavaScript and an HTML5 canvas element. Now about making it rich and interactive? We'll need to add some mouse event handling. We'll do something simple here: as the mouse moves along the x-axis of the graph we'll find the current data point based solely on its x-position. This technique is more useful to an end-user and saves the calculation of finding how close a point is to a line segment.

Mouse events are still rather browser specific, so the calculations presented here to determine the offset of the mouse inside of the canvas are simplified and will not work in all scenarios.

```
graph1.addEventListener('mousemove', mouseWatcher, false); function mouseWatcher(evt) { // Get the mouse position relative to the canvas element. This stuff // is still gnarly across browsers. Here we're assuming we need to // figure out the offset the canvas has in the client area, so our // mouse position is really relative to the canvas, not the client area. var x = graph1.offsetLeft + evt.clientX; var y = graph1.height + graph1.offsetTop - evt.clientY; // Get the data point at this X position var foundPoint = -1; var x1 = points[0].x; for (var i = 1; i \< points.length; i++) { var x2 = points[i].x; if (x \>= x1 && x \<= x2) { foundPoint = i-1; break; } } if (foundPoint \>= 0) { txt = "" + data[foundPoint].value.toFixed(2) + " @ " + data[foundPoint].time.toDateString(); // draw a new information line in the legend context.save(); context.font = font; context.clearRect(0, yEnd - fontHeight, xEnd, fontHeight); context.fillText(txt, 0, yEnd, xEnd); context.restore(); } }
```

<!--nextpage-->  
And that's it. Over your Sunday morning coffee you can write a simple, yet effective, interactive graph display using HTML and JavaScript alone. Clearly, a tremendous amount of work remains to make the graphs beautiful and robust, but luckily a large number of people are already working on libraries to do this work for us.

Internet Explorer will not yet display canvas elements natively, but luckily this problem is being [solved](http://blog.vlad1.com/2008/07/30/no-browser-left-behind/) for us.

There are other problems, too. Today, for example, the font measurement abilities in the HTML5 specification are lacking.

If you want to see the example in action click [here.](http://chadgibbons.com/wp-content/uploads/2010/04/canvas-graphs.html) View the source in your browser to see the final source code to the example. A screenshot of the example is below.

[![]({{ site.baseurl }}/assets/images/Screen-shot-2010-04-11-at-16.44.55.png "Screen shot of graph")](http://chadgibbons.com/wp-content/uploads/2010/04/Screen-shot-2010-04-11-at-16.44.55.png)

