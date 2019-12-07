---
title: new MacBook setup
date: 2009-03-17 21:07:37.000000000 -07:00
type: post
categories: [jobs, software development, technology, zenoss]
tags: [apple, mac]
author: chadwick
permalink: "/2009/03/17/new-macbook-setup/"
---
I bought another Mac today, a nice 2.4 GHz 13-inch unibody MacBook. I had
planned on buying a 17-inch unibody MacBook Pro, and very nearly did, but
luckily sanity won out and I remembered how much of a hassle it was to carry
around those giant things, even if they are only "only" 6.6 lbs.

I had a 2.0 GHz 13-inch MacBook a couple of years ago when the first
Intel-based models came out and I do remember the screen resolution, while not
abundant, was more than adequate for browsing, e-mail and even development.
And, the unibody model is only 4.5 lbs, so 2 lbs lighter will be a lot nicer
to carry around. I also sprung for a spare battery to try and help get a
little closer to the awesome battery life of the 17-inch model.

Of course, the obvious question is why buy another laptop when I've already
got a nice 15-inch MacBook Pro that work provides? The answer there is easy: I
don't want to do anything personal, even development, on the work provided
machine.

Now, on to the actual system setup, documented here for posterity.

1. After account creation, run software update and get all the latest updates installed first.
2. Create an applecare account with an easy, but secure, password. This way the Apple store geeks can have that account should there need to be any repair work done.
3. Change the battery lifetime display with Show -\> **Time**.
4. Secure the screensaver by using System Preferences -\> Security -\> General and checking the **Require password to wake this computer from sleep or screen saver** option.
5. Disable the Front Row remote by using System Preferences -\> Security -\> General and checking the **Disable remote control infrared receiver** option.
6. Disable the Front Row keyboard shortcut by using System Preferences -\> Keyboard & Mouse -\> Keyboard Shortcuts and disabling the **Hide and show Front Row shortcut**.
7. Enable full keyboard shortcuts by checking the **All controls** option in the bottom of the same Keyboard Shortcuts screen.
8. Enable the **Use secure virtual memory** option in System Preferences -\> Security -\> General.
9. Encrypt my home directory with System Preferences -\> Security -\> FileVault.
10. Install Growl 1.1.4 from [http://growl.info/](http://growl.info/ "Growl")
  1. Install the GrowlSafari extra package.
  2. Install the HardwareGrowler extra package.
    1. Drag HardwareGrowler.app to /Applications
    2. Disable the HardwareGrowler dock icon by following the instructions at [http://growl.info/documentation/hardwaregrowler.php](http://growl.info/documentation/hardwaregrowler.php "HardwareGrowler documentation")
    3. Add HardwareGrowler to the start at login list by using System Preferences -\> Accounts -\> Login Items and dragging HardwareGrowler to the list.
  3. Enable Growl starting at login with System Preferences -\> Growl and enabling the **Start Growl at login** option.
11. Remove unused printer drivers by deleting the appropriate folders in /Library/Printers folder (everything but Brother, hp and PPDs in my case).
12. Install the XcodeTools package from the Installation DVD's Optional Installs directory.
13. Drag Xcode to the dock by going to /Developer/Applications and dragging the icon to the dock.
14. Add Activity Monitor to the dock by going to /Applications/Utilities and dragging the icon to the dock. Seondary-click on the icon and enable **Open at Login**.
15. Add Terminal to the dock by going to /Applications/Utilities and dragging the icon to the dock.
  1. Change the default Terminal settings by starting Terminal.app, selecting Preferences (Cmd-,) and then changing the "new window with settings" to Pro.
  2. Select the Pro scheme in the Settings tab and click default.
  3. Choose the Window tab with the Pro scheme selected, click the Background color chooser and set the opacity level to 90%.
  4. Change the window size to 80 columns and 36 rows.
16. Customize vim by creating ~/.vimrc with the following content:  
`
:color elflord
:syntax enable
:set shiftwidth=4
:set expandtab
:set autoindent
:set cindent
:set enc=utf-8
:set nu
:set showmatch
:set laststatus=2
:set nocompatible
:set gfn=Monaco:h15:a
`
17. Enable color highlighting for ls by adding the following lines to /etc/bashrc:  
`
alias ls='ls -CFG'
alias dir='ls -FGlas'
`
18. Install the Safari 4 beta from [http://www.apple.com/safari/download](http://www.apple.com/safari/download "Apple Safari download")
19. Install Firefox 3 from [http://getfirefox.com/](http://getfirefox.com/ "Firefox download") and drag it to the dock.
20. Install iStat pro from [http://www.islayer.com/apps/istatpro/](http://www.islayer.com/apps/istatpro/ "iStat pro")
21. Install MySQL 5.1 x86 community edition from [http://dev.mysql.com/downloads/mysql/5.1.html](http://dev.mysql.com/downloads/mysql/5.1.html "MySQL 5.1 community downloads") be sure to install the StartupItem package as well as the preference pane.
22. Add MySQL to the shell profile by appending the following to /etc/bashrc:  
`
export PATH=/usr/local/mysql/bin:$PATH`
23. Install EverNote from&nbsp;[http://www.evernote.com/](http://www.evernote.com/ "EverNote")
24. Install DropBox from [http://www.getdropbox.com/](http://www.getdropbox.com/ "Get DropBox!")
25. Install the Windows Media Components for QuickTime from&nbsp;[http://www.microsoft.com/windows/windowsmedia/player/wmcomponents.mspx](http://www.microsoft.com/windows/windowsmedia/player/wmcomponents.mspx "Windows Media Components for QuickTime")
26. Install Twitterrific from&nbsp;[http://iconfactory.com/software/twitterrific](http://iconfactory.com/software/twitterrific "Twitterrific")
27. Disable automatic synchronization for iPhones and iPods since this won't be the primary iTunes machine by going to iTunes Preferences and enabling **Disable automatic syncing for iPhones and iPods** on the Devices tab.
28. Install the iPhone SDK from [http://developer.apple.com/](http://developer.apple.com/ "Apple Developer Portal")
29. Party! Or maybe just nap.
