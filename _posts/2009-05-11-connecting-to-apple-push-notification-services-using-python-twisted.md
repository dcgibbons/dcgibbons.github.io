---
title: Connecting to Apple Push Notification Services using Python & Twisted
date: 2009-05-11 09:34:01.000000000 -07:00
type: post
categories: [software development, technology]
tags: [apns, cloud, iphone, python, twisted]
author: chadwick
permalink: "/2009/05/11/connecting-to-apple-push-notification-services-using-python-twisted/"
---
One of the exciting features of the upcoming [iPhone
3.0](http://www.apple.com/iphone/preview-iphone-os/) operating system is the
ability for a device to receive a notification message from your own
application that is relayed by Apple's network cloud. This feature allows the
iPhone to channel all out-of-band communication into a narrow channel that is
low impact on the device from a power, security and usability point-of-view.

As an application developer, you are responsible for two pieces to make this
new notification service work: the actual application that runs on the iPhone
OS, and a provider service that both communicates with the device and directly
to Apple's cloud.

In a typical flow, the application on an iPhone device issues an API call to
request notifications for the identifier that the developer has assigned to
the application. In response to that API call, Apple's servers provide the
device with a binary token value that uniquely identifies the device &
installation combination (for security reasons, the device token is reset if
the device is reset, so it is not a one-to-one mapping to the actual
hardware). Next, the application must connect to the developer's provider
servers and provide it with the device token it has received from apple. The
provider can now use the device token when communicating back to the [Apple
Push Notification Service
(APNS)](http://developer.apple.com/iphone/program/sdk/apns.html) cloud.

A provider implementation has very little work to do to inform APNS of a
device update. Most of the effort in a provider will be in the actual
framework of the application itself, and managing what information should be
sent to a device. A common implementation will be for a provider to both
communicate with the APNS server cloud and also to the application's own
network services and effectively become a protocol translator. Such a heavily
network based application like that is a perfect match for the
[Python](http://www.python.org/) language and the
[Twisted](http://twistedmatrix.com/) framework.

A provider to APNS link is very simple: a secure-socket connection (SSL) is
made to a APNS server and then simple messages are sent by the provider
whenever a notification needs to be sent to the device. The APNS server does
not respond or acknowledge the message. Every so often (Apple recommends once
an hour), the provider server should connect to a web server that will dump a
list of device tokens that are no longer valid (as in the device has
uninstalled the application). This is the provider's only feedback mechanism
outside of communicating directly with a device.

The first step is to setup an SSL connection to the APNS servers. By following
the directions on Apple's developer portal, you can create a certificate and
private key that are assigned to your application identifier. This certificate
& private key must then be used when connecting to the APNS servers as an
authentication mechanism.

One caveat &nbsp;- the Mac OS X Keychain Access application does not directly
export certificates and private keys in Private Enhanced Mail (.pem)
&nbsp;format, which is what the [OpenSSL](http://www.openssl.org/)
implementation we use with Twisted will want, but luckily there's an easy
mechanism to convert if you export the files as Personal Information Exchange
(.p12) format. The following two commands can be used to convert the .p12
files into .pem files using the built-in openssl command on Mac OS X or most
Linux distributions:

```
openssl pkcs12 -in cred.p12 -out certkey.pem -nodes -clcerts openssl pkcs12 -in pkey.p12 -out pkey.pem -nodes -clcerts
```

Now that we have our SSL files in the proper format, we can build our
`ClientContextFactory` object that will be used by Twisted to initiate a
connection to the APNS servers:

```
class APNSClientContextFactory(ClientContextFactory): def \_\_init\_\_(self): self.ctx = SSL.Context(SSL.SSLv3\_METHOD) self.ctx.use\_certificate\_file(APNS\_SSL\_CERTIFICATE\_FILE) self.ctx.use\_privatekey\_file(APNS\_SSL\_PRIVATE\_KEY\_FILE) def getContext(self): return self.ctx
```

We'll also need a `ClientFactory` object that will be used to build the
`Protocol` object whenever a connection is established to a server:

```
class APNSClientFactory(ClientFactory): def buildProtocol(self, addr): print "Connected to APNS Server %s:%u" % (addr.host, addr.port) return APNSProtocol() def clientConnectionLost(self, connector, reason): print "Lost connection. Reason: %s" % reason def clientConnectionFailed(self, connector, reason): print "Connection failed. Reason: %s" % reason
```

Next, we'll need the actual `Protocol` object that will format messages and
queue them to the server. For APNS, we don't receive any responses so that
half of the protocol goes unused.

```
class APNSProtocol(Protocol): def sendMessage(self, deviceToken, payload): # notification messages are binary messages in network order # using the following format: # \<1 byte command\> \<2 bytes length\> \<2 bytes length\> fmt = "!cH32sH%ds" % len(payload) command = '\x00' msg = struct.pack(fmt, command, 32, deviceToken, len(payload), payload) self.transport.write(msg)
```

And finally, we'll need the main code to kick everything off for the test:

```
if \_\_name\_\_ == '\_\_main\_\_': reactor.connectSSL(APNS\_SERVER\_HOSTNAME, APNS\_SERVER\_PORT, APNSClientFactory(), APNSClientContextFactory()) reactor.run()
```

From here, the Python and Twisted combination can be easily extended to handle
multiple protocols and convert between them as needed. For example, one of the
commonly expected use cases of the new push feature will be instant messaging
(IM) clients that will need to provide a proxy between the device and the IM
servers and the APNS servers in order to notify a device of outstanding
messages.

The full Python script containing the above excerpts can be downloaded here:

[test-apns-blog](http://chadgibbons.com/2009/05/11/connecting-to-apple-push-notification-services-using-python-twisted/test-apns-blog/)

