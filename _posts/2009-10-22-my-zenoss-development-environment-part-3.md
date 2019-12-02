---
title: My Zenoss Development Environment - Part 3
date: 2009-10-22 16:01:01.000000000 -07:00
type: post
categories: [jobs, software development, technology, zenoss]
tags: [eclipse, open source, pyuthon, work, zenoss]
author: chadwick
permalink: "/2009/10/22/my-zenoss-development-environment-part-3/"
---
In [Part 1](../2009/10/22/my-zenoss-development-environment-part-1/) of this series we discussed getting an initial [Zenoss](http://www.zenoss.com/) environment checked out and running on a [Mac OS X](http://www.apple.com/macosx/)or [Ubuntu](http://www.ubuntu.com/) system. In [Part 2](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-2/) we discussed how to configure [Eclipse](http://www.eclipse.org/) to use the Zenoss source. In this part, we'll discuss how to handle day-to-day operations such as branch management and working with multiple versions.

## Branch-Based Development

At Zenoss we do all development, including bug fixes and small maintenance tasks, in a private development branch within the subversion repository. This allows us to independently work-on changes, check-them into the repository for safe-keeping, and then perform code reviews with team members without having to share files or using [pastebin](http://pastebin.com/) style tools (even though we do both at times).

1. Create a branch within your user's sandbox. In this example, I've decided to name the sandbox `new-widget` to identify what I'm working on. If I were fixing a defect, I'd use the defect number from the defect tracking system. Create the branch by copying the trunk folder to the sandbox branch. In Subversion this is a low-overhead operation and doesn't actually copy files.`
svn copy http://dev.zenoss.org/svn/trunk http://dev.zenoss.org/svn/sandboxen/cgibbons/new-widget -m " * Copying trunk to sandbox branch."
`
2. Switch your working directory to use the new sandbox branch. You can do this either from the command-line or using Eclipse. From the command line, you'd do the following:`
cd $HOME/zenoss/core
svn switch http://dev.zenoss.org/svn/sandboxen/cgibbons/new-widget
`From within Eclipse, secondary-click on the `core` project and choose _Switch to Another Branch/Tag/Revision..._ option from the Team menu. On the dialog that appears, enter in the sandbox URL. After switching, your Eclipse will show the new location next to the core project item.  
[![svn switch]({{ site.baseurl }}/assets/images/Picture-8.png "svn switch")](http://chadgibbons.com/2009/10/22/my-zenoss-development-environment-part-3/picture-8/)

Once your development environment has been switched, you can make changes and commit to the Subversion repository as desired. If you're unsure if you are in the right branch, you can always use the `svn info` command to see which directory is being used.

## Merging Branches

Once you have completed changes in a branch and have had them reviewed by a peer, it is time to merge them into trunk (or another branch, if using a maintenance release). Merging can be tricky, but a consistent process can make it much easier to handle.

1. Change your working directory to a checked-out and clean version of the branch you want to merge into. For example, I keep a `$HOME/zenoss/clean-trunk` directory that I never make changes to, except for merging.
2. Determine the base working revision of your working branch. There are a variety of ways to do this, but one of the best is to view the revision log graph within the Trac system directly. For example, for the branch discussed above we can browse to [http://dev.zenoss.org/trac/log/sandboxen/cgibbons/new-widget/](http://dev.zenoss.org/trac/log/sandboxen/cgibbons/new-widget) and see that revision **15513** is the base.
3. Perform a dry-run on the merge to get a general idea of what the changes into the branch will be. You should see your expected changes, plus any conflicts from changes to the other branch while you have been working in the sandbox branch.`
svn merge --dry-run --revision 15513:HEAD http://dev.zenoss.org/svn/sandboxen/cgibbons/new-widget .
`
4. If the merge results look satisfactory, rerun the command without the dry-run argument.
5. Look at the final merge results using `svn status` and `svn diff`, and once you're ready, issue an `svn commit`.

## Multiple Branches and Zenoss Configuration

As you switch between branches you will often render your Zenoss configuration useless.&nbsp; Resetting your database after each branch switch is usually a good practice, and being able to quickly recreate any test data you may need makes this process less painful.

After switching a branch, my process is usually the following:

1. Shutdown zenoss and restart only zeo.`
zenoss stop
zeoctl start`
2. Run the zenwipe script from the inst source directory.`
$HOME/zenoss/inst/zenwipe.sh --no-prompt`
3. Run `zenmigrate` to install any database changes available within the current branch.

Depending upon the task at hand, I may install additional ZenPacks and add new devices through the command-line if those are needed. Helper scripts, such as `install-windows.sh` to install of the Windows ZenPacks and create several local test devices in the instance, are useful tools to have for your typical configurations.

