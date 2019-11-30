---
layout: post
title: My Zenoss Development Environment - Part 2
date: 2009-10-22 13:26:36.000000000 -07:00
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
- eclipse
- open source
- Python
- work
- Zenoss
meta:
  _edit_last: '1'
  _oembed_c4f43d36b8395634d1217fa55f78fbee: "{{unknown}}"
  _oembed_c3ad068fb66b9fe4bebb605661b4822e: "{{unknown}}"
  _oembed_81e13ee8c16de54815ece416cb1cb88a: "{{unknown}}"
  _oembed_1ebc588ba30f74e8061a827e30b41a64: "{{unknown}}"
  _oembed_195afe370ba05af0ffa96adef6665894: "{{unknown}}"
  _oembed_dc9ecc9c995a7a0a9f553a4605182d5d: "{{unknown}}"
  _oembed_6ab0856aec29b076321d4d27617e39f6: "{{unknown}}"
  _oembed_a6e6a2b6c76d720b501420e8a88e6a00: "{{unknown}}"
  _oembed_e2519c176316d918a9c5beef692dab2f: "{{unknown}}"
  _oembed_a81681e676854f61fe369e96dc87f010: "{{unknown}}"
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2009/10/22/my-zenoss-development-environment-part-2/"
---
In [Part 1](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-1/) of this series we discussed getting an initial [Zenoss](http://www.zenoss.com/) environment checked out and running on a [Mac OS X](http://www.apple.com/macosx/)or [Ubuntu](http://www.ubuntu.com/) system. In this part, we'll discuss configuring [Eclipse](http://www.eclipse.org/) to use this environment.

## Mac OS X Prerequisites

1. Install [Eclipse Classic](http://www.eclipse.org/downloads/) 3.5.x Mac [Cocoa 32-bit](http://blog.zvikico.com/2009/06/eclipse-galileo-for-mac-cocoa-or-carbon.html).

## Ubuntu Prerequisites

1. Install the Sun Java JDK. **Why?** Eclipse is a Java application and requires a full-fledged Java environment to run properly.`
sudo apt-get -y install sun-java6-jdk
`
2. Install [Eclipse Classic](http://www.eclipse.org/downloads/) 3.5.x Linux 32-bit.

## Eclipse Configuration

1. In part one, we created a Zenoss root project directory of `$HOME/zenoss` - use that directory, or the one you created, for the rest of these steps.
2. Launch Eclipse and configure it to use the Zenoss root project directory. **Why?** Eclipse needs a workspace directory to keep track of configuration settings for a group of related projects. By placing the workspace directory inside of the Zenoss root workspace, we can separate the requirements for a Zenoss workspace from other projects you may be using.[![eclipse-workspace]({{ site.baseurl }}/assets/images/eclipse-workspace1.png "eclipse-workspace")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-1/eclipse-workspace-2/)
3. Install the [PyDev](http://pydev.org/) plug-in for Eclipse. **Why?** PyDev provides Python language support to Eclipse.
  1. Go to the Help Menu and choose _Install New Software_.
  2. In the Available Software dialog, choose _Add_ and enter in `http://pydev.org/updates/` as the Location and close the dialog. Eclipse will return to the Available Software dialog.[![PyDev]({{ site.baseurl }}/assets/images/Picture-5.png "PyDev")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-1/picture-5/)
  3. Software matching PyDev will appear in the dialog; pick the _PyDev_ option but do not pick _PyDev Mylyn Integration_. Click _Next_ and install the plug-in.

[![PyDev]({{ site.baseurl }}/assets/images/Picture-61.png "PyDev")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-1/picture-6-2/)

4. Install the [Subclipse](http://subclipse.tigris.org/) plug-in. **Why?** Subclipse allows you to work with the Subversion version control system directly from within Eclipse.
  1. In the Available Software dialog add the Subclipse plug-in update site: `
http://subclipse.tigris.org/update_1.6.x
`
  2. In the Available Software dialog, choose the _Subclipse_, _Subversion Client Adapter_, _Subversion JavaHL Native Library Adapter_ and the _Subversion Revision Graph_ items.[![Subclipse]({{ site.baseurl }}/assets/images/Picture-51.png "Subclipse")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-2/picture-5-2/)
5. Go to the Window menu, choose Open Perspective and then SVN Repository Exploring (you may have to choose Other... to see this option).
6. Choose the New Repository Location button in the SVN Repositories panel. Add the Zenoss SVN site at `http://dev.zenoss.org/svn`
7. Open the SVN repository and select the `trunk` folder. Secondary-click the folder and choose the _Checkout..._ option. Be sure to change the Depth option to be _Only this item_ so that we don't check out any of the sub-folders of trunk just yet (many of the folders within trunk are not needed for development, but we want to keep the directory structure). In the next dialog you will be asked to choose a Project Wizard. Open the Pydev tree item and select the _Pydev Project_ option.[![svn checkout]({{ site.baseurl }}/assets/images/Picture-62.png "svn checkout")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-2/picture-6-3/)
8. Create the project in the Pydev Project dialog:
  1. Use `core` as the project name and use the default location. This should create a core project at `$HOME/zenoss/core`.
  2. Make sure the _Python_ project type is selected.
  3. Select _2.4_ as the Python Grammar version.
  4. Uncheck the _Create default 'src' folder.._. option.
  5. Click the Click here to _configure an interpreter not listed..._ option in order to add the python interpreter built by the Zenoss installation scripts.
    1. In the Preferences Dialog, choose the Interpreter - Python item underneath Pydev and select the _New..._ button to add a new Python interpreter.
    2. Browse to the `$ZENHOME/bin` directory and choose the `python2.4` executable from that directory.
    3. Name the interpreter `python-2.4`, `zenoss-python` or some other variant.

[![Picture 13]({{ site.baseurl }}/assets/images/Picture-13.png "Picture 13")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-2/picture-13/)After the new Python interpreter has been added, return to the Pydev Project dialog and choose that interpreter from the list and then click _Finish_ to create the project.

9. Update the `core` folder from the command-line SVN client so you can selectively pull the sub-folders of the core project and not all of them:`
cd $HOME/zenoss/core
svn update Products
`
10. Move the Products directory the installation checked out and create a symbolic link to the one updated above. **Why?** This allows the Products source tree to be worked on from Eclipse and then also used by the Zenoss run-time.`
cd $ZENHOME
mv Products Products.old
ln -s $HOME/zenoss/core/Products Products`
11. Return to Eclipse and choose the _Refresh_ option from the File menu so that Eclipse notices the updated directory and builds necessary dependencies.
12. Secondary-click on the core project folder in Eclipse and choose _Properties_. Choose the _PyDev - PYTHONPATH_ item and add source folders so PyDev can reference the project from within itself.
  1. In the Source Folders tab choose the _Add source folder_ button and pick the root `core` folder from the provided list.[![Picture 2]({{ site.baseurl }}/assets/images/Picture-2.png "Picture 2")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-2/picture-2/)
  2. In the External Libraries tab choose the _Add source folder_ button and choose the `$ZENHOME/lib/python` directory.[![Picture 3]({{ site.baseurl }}/assets/images/Picture-3.png "Picture 3")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-2/picture-3/)

At this point, your Eclipse project should allow you to navigate between dependencies within the Zenoss project. You can also simultaneously switch between using the Team feature within Eclipse to update and manage Subversion or do so using the command-line svn client.

## Next...

In [Part 3](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-3/) of this series, we'll discuss how to manage day-to-day activities such as creating sandbox branches for changes and dealing with multiple versions are done from within the same environment.

