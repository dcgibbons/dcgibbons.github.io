---
layout: post
title: Connecting to Apple Push Notification Services using Python & Twisted
date: 2009-05-11 09:34:01.000000000 -07:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Software Development
- Technology
tags:
- apns
- cloud
- iphone
- Python
- twisted
meta:
  _edit_last: '1'
  wp-syntax-cache-content: "a:5:{i:1;s:737:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"bash\" style=\"font-family:monospace;\">openssl pkcs12
    <span style=\"color: #660033;\">-in</span> cred.p12 <span style=\"color: #660033;\">-out</span>
    certkey.pem <span style=\"color: #660033;\">-nodes</span> <span style=\"color:
    #660033;\">-clcerts</span>\nopenssl pkcs12 <span style=\"color: #660033;\">-in</span>
    pkey.p12 <span style=\"color: #660033;\">-out</span> pkey.pem <span style=\"color:
    #660033;\">-nodes</span> <span style=\"color: #660033;\">-clcerts</span></pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">openssl pkcs12 -in cred.p12 -out certkey.pem
    -nodes -clcerts\r\nopenssl pkcs12 -in pkey.p12 -out pkey.pem -nodes -clcerts</p></div>\n\";i:2;s:2075:\"\n<div
    class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td class=\"code\"><pre
    class=\"python\" style=\"font-family:monospace;\"><span style=\"color: #ff7700;font-weight:bold;\">class</span>
    APNSClientContextFactory<span style=\"color: black;\">&#40;</span>ClientContextFactory<span
    style=\"color: black;\">&#41;</span>:\n    <span style=\"color: #ff7700;font-weight:bold;\">def</span>
    <span style=\"color: #0000cd;\">__init__</span><span style=\"color: black;\">&#40;</span><span
    style=\"color: #008000;\">self</span><span style=\"color: black;\">&#41;</span>:\n
    \       <span style=\"color: #008000;\">self</span>.<span style=\"color: black;\">ctx</span>
    <span style=\"color: #66cc66;\">=</span> SSL.<span style=\"color: black;\">Context</span><span
    style=\"color: black;\">&#40;</span>SSL.<span style=\"color: black;\">SSLv3_METHOD</span><span
    style=\"color: black;\">&#41;</span>\n        <span style=\"color: #008000;\">self</span>.<span
    style=\"color: black;\">ctx</span>.<span style=\"color: black;\">use_certificate_file</span><span
    style=\"color: black;\">&#40;</span>APNS_SSL_CERTIFICATE_FILE<span style=\"color:
    black;\">&#41;</span>\n        <span style=\"color: #008000;\">self</span>.<span
    style=\"color: black;\">ctx</span>.<span style=\"color: black;\">use_privatekey_file</span><span
    style=\"color: black;\">&#40;</span>APNS_SSL_PRIVATE_KEY_FILE<span style=\"color:
    black;\">&#41;</span>\n&nbsp;\n<span style=\"color: #ff7700;font-weight:bold;\">def</span>
    getContext<span style=\"color: black;\">&#40;</span><span style=\"color: #008000;\">self</span><span
    style=\"color: black;\">&#41;</span>:\n    <span style=\"color: #ff7700;font-weight:bold;\">return</span>
    <span style=\"color: #008000;\">self</span>.<span style=\"color: black;\">ctx</span></pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">class APNSClientContextFactory(ClientContextFactory):\r\n
    \   def __init__(self):\r\n        self.ctx = SSL.Context(SSL.SSLv3_METHOD)\r\n
    \       self.ctx.use_certificate_file(APNS_SSL_CERTIFICATE_FILE)\r\n        self.ctx.use_privatekey_file(APNS_SSL_PRIVATE_KEY_FILE)\r\n\r\ndef
    getContext(self):\r\n    return self.ctx</p></div>\n\";i:3;s:2497:\"\n<div class=\"wp_syntax\"
    style=\"position:relative;\"><table><tr><td class=\"code\"><pre class=\"python\"
    style=\"font-family:monospace;\"><span style=\"color: #ff7700;font-weight:bold;\">class</span>
    APNSClientFactory<span style=\"color: black;\">&#40;</span>ClientFactory<span
    style=\"color: black;\">&#41;</span>:\n    <span style=\"color: #ff7700;font-weight:bold;\">def</span>
    buildProtocol<span style=\"color: black;\">&#40;</span><span style=\"color: #008000;\">self</span><span
    style=\"color: #66cc66;\">,</span> addr<span style=\"color: black;\">&#41;</span>:\n
    \       <span style=\"color: #ff7700;font-weight:bold;\">print</span> <span style=\"color:
    #483d8b;\">&quot;Connected to APNS Server %s:%u&quot;</span> % <span style=\"color:
    black;\">&#40;</span>addr.<span style=\"color: black;\">host</span><span style=\"color:
    #66cc66;\">,</span> addr.<span style=\"color: black;\">port</span><span style=\"color:
    black;\">&#41;</span>\n        <span style=\"color: #ff7700;font-weight:bold;\">return</span>
    APNSProtocol<span style=\"color: black;\">&#40;</span><span style=\"color: black;\">&#41;</span>\n&nbsp;\n
    \   <span style=\"color: #ff7700;font-weight:bold;\">def</span> clientConnectionLost<span
    style=\"color: black;\">&#40;</span><span style=\"color: #008000;\">self</span><span
    style=\"color: #66cc66;\">,</span> connector<span style=\"color: #66cc66;\">,</span>
    reason<span style=\"color: black;\">&#41;</span>:\n        <span style=\"color:
    #ff7700;font-weight:bold;\">print</span> <span style=\"color: #483d8b;\">&quot;Lost
    connection. Reason: %s&quot;</span> % reason\n&nbsp;\n    <span style=\"color:
    #ff7700;font-weight:bold;\">def</span> clientConnectionFailed<span style=\"color:
    black;\">&#40;</span><span style=\"color: #008000;\">self</span><span style=\"color:
    #66cc66;\">,</span> connector<span style=\"color: #66cc66;\">,</span> reason<span
    style=\"color: black;\">&#41;</span>:\n        <span style=\"color: #ff7700;font-weight:bold;\">print</span>
    <span style=\"color: #483d8b;\">&quot;Connection failed. Reason: %s&quot;</span>
    % reason</pre></td></tr></table><p class=\"theCode\" style=\"display:none;\">class
    APNSClientFactory(ClientFactory):\r\n    def buildProtocol(self, addr):\r\n        print
    &quot;Connected to APNS Server %s:%u&quot; % (addr.host, addr.port)\r\n        return
    APNSProtocol()\r\n\r\n    def clientConnectionLost(self, connector, reason):\r\n
    \       print &quot;Lost connection. Reason: %s&quot; % reason\r\n\r\n    def
    clientConnectionFailed(self, connector, reason):\r\n        print &quot;Connection
    failed. Reason: %s&quot; % reason</p></div>\n\";i:4;s:2808:\"\n<div class=\"wp_syntax\"
    style=\"position:relative;\"><table><tr><td class=\"code\"><pre class=\"python\"
    style=\"font-family:monospace;\"><span style=\"color: #ff7700;font-weight:bold;\">class</span>
    APNSProtocol<span style=\"color: black;\">&#40;</span>Protocol<span style=\"color:
    black;\">&#41;</span>:\n    <span style=\"color: #ff7700;font-weight:bold;\">def</span>
    sendMessage<span style=\"color: black;\">&#40;</span><span style=\"color: #008000;\">self</span><span
    style=\"color: #66cc66;\">,</span> deviceToken<span style=\"color: #66cc66;\">,</span>
    payload<span style=\"color: black;\">&#41;</span>:\n        <span style=\"color:
    #808080; font-style: italic;\"># notification messages are binary messages in
    network order</span>\n        <span style=\"color: #808080; font-style: italic;\">#
    using the following format:</span>\n        <span style=\"color: #808080; font-style:
    italic;\"># &amp;lt;1 byte command&amp;gt; &amp;lt;2 bytes length&amp;gt; &amp;lt;2
    bytes length&amp;gt;</span>\n&nbsp;\n        fmt <span style=\"color: #66cc66;\">=</span>
    <span style=\"color: #483d8b;\">&quot;!cH32sH%ds&quot;</span> % <span style=\"color:
    #008000;\">len</span><span style=\"color: black;\">&#40;</span>payload<span style=\"color:
    black;\">&#41;</span>\n        command <span style=\"color: #66cc66;\">=</span>
    <span style=\"color: #483d8b;\">'<span style=\"color: #000099; font-weight: bold;\">\\x</span>00'</span>\n
    \       msg <span style=\"color: #66cc66;\">=</span> <span style=\"color: #dc143c;\">struct</span>.<span
    style=\"color: black;\">pack</span><span style=\"color: black;\">&#40;</span>fmt<span
    style=\"color: #66cc66;\">,</span> command<span style=\"color: #66cc66;\">,</span>
    <span style=\"color: #ff4500;\">32</span><span style=\"color: #66cc66;\">,</span>
    deviceToken<span style=\"color: #66cc66;\">,</span>\n                          <span
    style=\"color: #008000;\">len</span><span style=\"color: black;\">&#40;</span>payload<span
    style=\"color: black;\">&#41;</span><span style=\"color: #66cc66;\">,</span> payload<span
    style=\"color: black;\">&#41;</span>\n        <span style=\"color: #008000;\">self</span>.<span
    style=\"color: black;\">transport</span>.<span style=\"color: black;\">write</span><span
    style=\"color: black;\">&#40;</span>msg<span style=\"color: black;\">&#41;</span></pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">class APNSProtocol(Protocol):\r\n    def
    sendMessage(self, deviceToken, payload):\r\n        # notification messages are
    binary messages in network order\r\n        # using the following format:\r\n
    \       # &amp;lt;1 byte command&amp;gt; &amp;lt;2 bytes length&amp;gt; &amp;lt;2
    bytes length&amp;gt;\r\n\r\n        fmt = &quot;!cH32sH%ds&quot; % len(payload)\r\n
    \       command = '\\x00'\r\n        msg = struct.pack(fmt, command, 32, deviceToken,\r\n
    \                         len(payload), payload)\r\n        self.transport.write(msg)</p></div>\n\";i:5;s:1282:\"\n<div
    class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td class=\"code\"><pre
    class=\"python\" style=\"font-family:monospace;\"><span style=\"color: #ff7700;font-weight:bold;\">if</span>
    __name__ <span style=\"color: #66cc66;\">==</span> <span style=\"color: #483d8b;\">'__main__'</span>:\n
    \   reactor.<span style=\"color: black;\">connectSSL</span><span style=\"color:
    black;\">&#40;</span>APNS_SERVER_HOSTNAME<span style=\"color: #66cc66;\">,</span>\n
    \                      APNS_SERVER_PORT<span style=\"color: #66cc66;\">,</span>\n
    \                      APNSClientFactory<span style=\"color: black;\">&#40;</span><span
    style=\"color: black;\">&#41;</span><span style=\"color: #66cc66;\">,</span>\n
    \                      APNSClientContextFactory<span style=\"color: black;\">&#40;</span><span
    style=\"color: black;\">&#41;</span><span style=\"color: black;\">&#41;</span>\n
    \   reactor.<span style=\"color: black;\">run</span><span style=\"color: black;\">&#40;</span><span
    style=\"color: black;\">&#41;</span></pre></td></tr></table><p class=\"theCode\"
    style=\"display:none;\">if __name__ == '__main__':\r\n    reactor.connectSSL(APNS_SERVER_HOSTNAME,\r\n
    \                      APNS_SERVER_PORT,\r\n                       APNSClientFactory(),\r\n
    \                      APNSClientContextFactory())\r\n    reactor.run()</p></div>\n\";}"
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2009/05/11/connecting-to-apple-push-notification-services-using-python-twisted/"
---
One of the exciting features of the upcoming [iPhone 3.0](http://www.apple.com/iphone/preview-iphone-os/) operating system is the ability for a device to receive a notification message from your own application that is relayed by Apple's network cloud. This feature allows the iPhone to channel all out-of-band communication into a narrow channel that is low impact on the device from a power, security and usability point-of-view.

As an application developer, you are responsible for two pieces to make this new notification service work: the actual application that runs on the iPhone OS, and a provider service that both communicates with the device and directly to Apple's cloud.

In a typical flow, the application on an iPhone device issues an API call to request notifications for the identifier that the developer has assigned to the application. In response to that API call, Apple's servers provide the device with a binary token value that uniquely identifies the device & installation combination (for security reasons, the device token is reset if the device is reset, so it is not a one-to-one mapping to the actual hardware). Next, the application must connect to the developer's provider servers and provide it with the device token it has received from apple. The provider can now use the device token when communicating back to the [Apple Push Notification Service (APNS)](http://developer.apple.com/iphone/program/sdk/apns.html) cloud.

A provider implementation has very little work to do to inform APNS of a device update. Most of the effort in a provider will be in the actual framework of the application itself, and managing what information should be sent to a device. A common implementation will be for a provider to both communicate with the APNS server cloud and also to the application's own network services and effectively become a protocol translator. Such a heavily network based application like that is a perfect match for the [Python](http://www.python.org/) language and the [Twisted](http://twistedmatrix.com/) framework.

A provider to APNS link is very simple: a secure-socket connection (SSL) is made to a APNS server and then simple messages are sent by the provider whenever a notification needs to be sent to the device. The APNS server does not respond or acknowledge the message. Every so often (Apple recommends once an hour), the provider server should connect to a web server that will dump a list of device tokens that are no longer valid (as in the device has uninstalled the application). This is the provider's only feedback mechanism outside of communicating directly with a device.

The first step is to setup an SSL connection to the APNS servers. By following the directions on Apple's developer portal, you can create a certificate and private key that are assigned to your application identifier. This certificate & private key must then be used when connecting to the APNS servers as an authentication mechanism.

One caveat &nbsp;- the Mac OS X Keychain Access application does not directly export certificates and private keys in Private Enhanced Mail (.pem) &nbsp;format, which is what the [OpenSSL](http://www.openssl.org/) implementation we use with Twisted will want, but luckily there's an easy mechanism to convert if you export the files as Personal Information Exchange (.p12) format. The following two commands can be used to convert the .p12 files into .pem files using the built-in openssl command on Mac OS X or most Linux distributions:

```
openssl pkcs12 -in cred.p12 -out certkey.pem -nodes -clcerts openssl pkcs12 -in pkey.p12 -out pkey.pem -nodes -clcerts
```

Now that we have our SSL files in the proper format, we can build our `ClientContextFactory` object that will be used by Twisted to initiate a connection to the APNS servers:

```
class APNSClientContextFactory(ClientContextFactory): def \_\_init\_\_(self): self.ctx = SSL.Context(SSL.SSLv3\_METHOD) self.ctx.use\_certificate\_file(APNS\_SSL\_CERTIFICATE\_FILE) self.ctx.use\_privatekey\_file(APNS\_SSL\_PRIVATE\_KEY\_FILE) def getContext(self): return self.ctx
```

We'll also need a `ClientFactory` object that will be used to build the `Protocol` object whenever a connection is established to a server:

```
class APNSClientFactory(ClientFactory): def buildProtocol(self, addr): print "Connected to APNS Server %s:%u" % (addr.host, addr.port) return APNSProtocol() def clientConnectionLost(self, connector, reason): print "Lost connection. Reason: %s" % reason def clientConnectionFailed(self, connector, reason): print "Connection failed. Reason: %s" % reason
```

Next, we'll need the actual `Protocol` object that will format messages and queue them to the server. For APNS, we don't receive any responses so that half of the protocol goes unused.

```
class APNSProtocol(Protocol): def sendMessage(self, deviceToken, payload): # notification messages are binary messages in network order # using the following format: # \<1 byte command\> \<2 bytes length\> \<2 bytes length\> fmt = "!cH32sH%ds" % len(payload) command = '\x00' msg = struct.pack(fmt, command, 32, deviceToken, len(payload), payload) self.transport.write(msg)
```

And finally, we'll need the main code to kick everything off for the test:

```
if \_\_name\_\_ == '\_\_main\_\_': reactor.connectSSL(APNS\_SERVER\_HOSTNAME, APNS\_SERVER\_PORT, APNSClientFactory(), APNSClientContextFactory()) reactor.run()
```

From here, the Python and Twisted combination can be easily extended to handle multiple protocols and convert between them as needed. For example, one of the commonly expected use cases of the new push feature will be instant messaging (IM) clients that will need to provide a proxy between the device and the IM servers and the APNS servers in order to notify a device of outstanding messages.

The full Python script containing the above excerpts can be downloaded here:

[test-apns-blog](http://chadgibbons.com/2009/05/11/connecting-to-apple-push-notification-services-using-python-twisted/test-apns-blog/)

