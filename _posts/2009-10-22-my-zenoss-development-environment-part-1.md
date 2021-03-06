---
title: My Zenoss Development Environment - Part 1
date: 2009-10-22 11:05:46.000000000 -07:00
type: post
categories: [jobs, software development, technology, zenoss]
tags: [eclipse, open source, python, work, zenoss]
author: chadwick
permalink: "/2009/10/22/my-zenoss-development-environment-part-1/"
---
Over the past 18 months the developers at [Zenoss](http://www.zenoss.com/)
have used a variety of development environments and methods to productively
work with Zenoss, but there are a lot of best practices that have emerged out
of this diversity.

I develop Zenoss primarily on [Mac OS X](http://www.apple.com/macosx/), with
some work done on [Ubuntu](http://www.ubuntu.com/) when necessary. I normally
use [Eclipse](http://www.eclipse.org/) as my development editor, although I'll
often just use [vim](http://www.vim.org/) when doing quick changes or bug
fixes. In either case, careful setup of the Zenoss environment is key to being
able to productively work with both the new development version and with the
shipping versions that require maintenance.

The environment you get by default when you check out the source version of
Zenoss from the source repository, or from a source tarball, is not
necessarily setup in the best way to develop productively using tools like
Eclipse.

The rest of this post will document how both my Mac OS X and Ubuntu
environments are initially configured so that a working source Zenoss
installation is realized.

## Mac OS X Prerequisites

These prerequisite instructions assume Mac OS X 10.5 Leopard; 10.6 Snow
Leopard will not be able to compile Zenoss's third-party dependencies, so an
additional work-around is required for that platform until Zenoss moves to
[Python 2.6](http://www.python.org/download/releases/2.6/).

1. Install [Xcode](http://developer.apple.com/technology/xcode.html). **Why?** Installs the GNU C/C++ compiler and other command-line development tools needed to build dependencies used by Zenoss.
2. Install [Universal Subversion 1.6.x from CollabNet Community](http://www.open.collab.net/downloads/community/). **Why?** Leopard only comes with Subversion 1.4.x. This version is not compatible with the Subclipse plug-in for Eclipse that will be used later. In order to be able to use both the command-line and Eclipse Subversion versions simultaneously on the same checked our source, the release of subversion should match. This installation will place the Subversion binaries in `/opt/subversion` and should automatically add it to your `PATH`.
3. Install [MySQL Community Edition 5.1 32-bit](http://dev.mysql.com/downloads/). **Why?** Zenoss needs MySQL for storage of event data.

## Ubuntu Prerequisites

These prerequisite instructions assume Ubuntu 9.04 32-bit Desktop Edition.
Installing the server edition or one with different options may require
additional prerequisites to be installed.

1. Install Subversion. **Why?** Working with the Zenoss product in source form requires Subversion to access the source repositories (it is also possible to build directly from a source tarball, but this is not discussed here).  
`sudo apt-get -y install subversion
`
2. Install MySQL. **Why?** Zenoss needs MySQL for storage of event data.  
`sudo apt-get -y install mysql-client mysql-server libmysqlclient15-dev
`
3. Install additional development environment tools. **Why?** Zenoss third-party dependencies require several binaries to be built from source.  
`sudo apt-get -y install patch make vim gcc g++ autoconf`
4. Install SNMP support. **Why**? Zenoss requires SNMP libraries for monitoring, and having a local SNMP agent is useful for testing.`
sudo apt-get -y install libsnmp-base snmp snmpd`
5. Install Liberation TrueType fonts. **Why?** Graphs generated by RRDtool will not contain the correct glyphs without this font package.`
sudo apt-get -y install ttf-liberation`

## Environment Configuration

Configuring Eclipse will require determining where you want to work with your
Zenoss installation, and installing Eclipse plug-ins to provide the features
required for Python and Subversion support.

1. Create your Zenoss root directory:`
mkdir $HOME/zenoss
`
2. Create and run a `setup.sh` script that will configure needed environment variables for zenoss. This script can be started from your log in profile if desired.`
cd $HOME/zenoss
cat > zenoss-config.sh <<EOF
ZENHOME=$HOME/zenoss/zenhome
PYTHONPATH=$ZENHOME/lib/python
PATH=\$ZENHOME/bin:\$PATH
export ZENHOME PYTHONPATH PATH
EOF
chmod +x zenoss-config.sh
. zenoss-config.sh
mkdir $ZENHOME
`
3. Checkout the Zenoss source installation tree. **Why?** This tree is used to bootstrap the installation from the source repository and create a running Zenoss installation. We'll need this before we modify it to fit the needs of our development environment.`
svn co http://dev.zenoss.org/svn/trunk/inst inst
`
4. Run the installation script to checkout, compile, and configure a zenoss environment. If you need to customize your MySQL configuration at all do not use the `--no-prompt` argument.`
cd inst
./install.sh --no-prompt
`
5. Modify the `zensocket` file to be setuid root. **Why?** Some of the Zenoss daemons use a privileged port and making the file owned by root and accessible by the Zenoss user allows the daemons to be run as a non-priviledged user but still use the privileged port.`
sudo chown root:`id -g` $ZENHOME/bin/zensocket
sudo chmod 04750 $ZENHOME/bin/zensocket
`

At this point, you should have running zeo and zope processes and be able to
log on to the local Zenoss instance. Your Zenoss root directory should look
similar to the following:  [![zenoss workspace]({{ site.baseurl
}}/assets/images/Picture-4.png "zenoss
workspace")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-1/picture-4/)

## Next...

In [Part
2](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-2/
"Part 2") of this series, we'll download and configure the Eclipse IDE.

