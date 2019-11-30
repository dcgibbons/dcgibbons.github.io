---
layout: post
title: Getting a Native Code Stack Trace from a Zenoss Daemon
date: 2009-03-19 15:35:05.000000000 -07:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Jobs
- Zenoss
tags:
- C
- debug
- Python
meta:
  _edit_last: '2'
  wp-syntax-cache-content: "a:7:{i:1;s:891:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"python\" style=\"font-family:monospace;\">Traceback
    <span style=\"color: black;\">&#40;</span>most recent call last<span style=\"color:
    black;\">&#41;</span>:\nFile <span style=\"color: #483d8b;\">&quot;test.py&quot;</span><span
    style=\"color: #66cc66;\">,</span> line <span style=\"color: #ff4500;\">5</span><span
    style=\"color: #66cc66;\">,</span> <span style=\"color: #ff7700;font-weight:bold;\">in</span>
    ?\nz <span style=\"color: #66cc66;\">=</span> y / x\n<span style=\"color: #008000;\">ZeroDivisionError</span>:
    integer division <span style=\"color: #ff7700;font-weight:bold;\">or</span> modulo
    by zero</pre></td></tr></table><p class=\"theCode\" style=\"display:none;\">Traceback
    (most recent call last):\r\nFile &quot;test.py&quot;, line 5, in ?\r\nz = y /
    x\r\nZeroDivisionError: integer division or modulo by zero</p></div>\n\";i:2;s:2336:\"\n<div
    class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td class=\"code\"><pre
    class=\"python\" style=\"font-family:monospace;\">$ python -i\nPython 2.4.4 <span
    style=\"color: black;\">&#40;</span><span style=\"color: #808080; font-style:
    italic;\">#1, Feb 23 2009, 09:17:03) </span>\n<span style=\"color: black;\">&#91;</span>GCC
    4.0.1 <span style=\"color: black;\">&#40;</span>Apple Inc. <span style=\"color:
    black;\">build</span> <span style=\"color: #ff4500;\">5490</span><span style=\"color:
    black;\">&#41;</span><span style=\"color: black;\">&#93;</span> on darwin\nType
    <span style=\"color: #483d8b;\">&quot;help&quot;</span><span style=\"color: #66cc66;\">,</span>
    <span style=\"color: #483d8b;\">&quot;copyright&quot;</span><span style=\"color:
    #66cc66;\">,</span> <span style=\"color: #483d8b;\">&quot;credits&quot;</span>
    <span style=\"color: #ff7700;font-weight:bold;\">or</span> <span style=\"color:
    #483d8b;\">&quot;license&quot;</span> <span style=\"color: #ff7700;font-weight:bold;\">for</span>
    more information.\n<span style=\"color: #66cc66;\">&gt;&gt;&gt;</span> <span style=\"color:
    #ff7700;font-weight:bold;\">from</span> ctypes <span style=\"color: #ff7700;font-weight:bold;\">import</span>
    *\n<span style=\"color: #66cc66;\">&gt;&gt;&gt;</span> <span style=\"color: #ff7700;font-weight:bold;\">from</span>
    ctypes.<span style=\"color: black;\">util</span> <span style=\"color: #ff7700;font-weight:bold;\">import</span>
    *\n<span style=\"color: #66cc66;\">&gt;&gt;&gt;</span> lib <span style=\"color:
    #66cc66;\">=</span> CDLL<span style=\"color: black;\">&#40;</span>find_library<span
    style=\"color: black;\">&#40;</span><span style=\"color: #483d8b;\">'test'</span><span
    style=\"color: black;\">&#41;</span><span style=\"color: black;\">&#41;</span>\n<span
    style=\"color: #66cc66;\">&gt;&gt;&gt;</span> lib.<span style=\"color: black;\">doit</span><span
    style=\"color: black;\">&#40;</span><span style=\"color: black;\">&#41;</span>\nBus
    error</pre></td></tr></table><p class=\"theCode\" style=\"display:none;\">$ python
    -i\r\nPython 2.4.4 (#1, Feb 23 2009, 09:17:03) \r\n[GCC 4.0.1 (Apple Inc. build
    5490)] on darwin\r\nType &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot;
    or &quot;license&quot; for more information.\r\n&gt;&gt;&gt; from ctypes import
    *\r\n&gt;&gt;&gt; from ctypes.util import *\r\n&gt;&gt;&gt; lib = CDLL(find_library('test'))\r\n&gt;&gt;&gt;
    lib.doit()\r\nBus error</p></div>\n\";i:3;s:3012:\"\n<div class=\"wp_syntax\"
    style=\"position:relative;\"><table><tr><td class=\"code\"><pre class=\"bash\"
    style=\"font-family:monospace;\">$ <span style=\"color: #c20cb9; font-weight:
    bold;\">cat</span> <span style=\"color: #007800;\">$ZENHOME</span><span style=\"color:
    #000000; font-weight: bold;\">/</span>bin<span style=\"color: #000000; font-weight:
    bold;\">/</span>zenwin\n<span style=\"color: #666666; font-style: italic;\">#!
    /usr/bin/env bash</span>\n<span style=\"color: #666666; font-style: italic;\">#############################################################################</span>\n<span
    style=\"color: #666666; font-style: italic;\"># This program is part of Zenoss
    Core, an open source monitoring platform.</span>\n<span style=\"color: #666666;
    font-style: italic;\"># Copyright (C) 2007, Zenoss Inc.</span>\n<span style=\"color:
    #666666; font-style: italic;\">#</span>\n<span style=\"color: #666666; font-style:
    italic;\"># This program is free software; you can redistribute it and/or modify
    it</span>\n<span style=\"color: #666666; font-style: italic;\"># under the terms
    of the GNU General Public License version 2 as published by</span>\n<span style=\"color:
    #666666; font-style: italic;\"># the Free Software Foundation.</span>\n<span style=\"color:
    #666666; font-style: italic;\">#</span>\n<span style=\"color: #666666; font-style:
    italic;\"># For complete information please visit: http://www.zenoss.com/oss/</span>\n<span
    style=\"color: #666666; font-style: italic;\">#############################################################################</span>\n&nbsp;\n.
    <span style=\"color: #007800;\">$ZENHOME</span><span style=\"color: #000000; font-weight:
    bold;\">/</span>bin<span style=\"color: #000000; font-weight: bold;\">/</span>zenfunctions\n&nbsp;\n<span
    style=\"color: #007800;\">PRGHOME</span>=<span style=\"color: #007800;\">$ZENHOME</span><span
    style=\"color: #000000; font-weight: bold;\">/</span>Products<span style=\"color:
    #000000; font-weight: bold;\">/</span>ZenWin\n<span style=\"color: #007800;\">PRGNAME</span>=zenwin.py\n<span
    style=\"color: #007800;\">CFGFILE</span>=<span style=\"color: #007800;\">$CFGDIR</span><span
    style=\"color: #000000; font-weight: bold;\">/</span>zenwin.conf\n&nbsp;\ngeneric
    <span style=\"color: #ff0000;\">&quot;$@&quot;</span></pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">$ cat $ZENHOME/bin/zenwin\r\n#! /usr/bin/env
    bash\r\n#############################################################################\r\n#
    This program is part of Zenoss Core, an open source monitoring platform.\r\n#
    Copyright (C) 2007, Zenoss Inc.\r\n#\r\n# This program is free software; you can
    redistribute it and/or modify it\r\n# under the terms of the GNU General Public
    License version 2 as published by\r\n# the Free Software Foundation.\r\n#\r\n#
    For complete information please visit: http://www.zenoss.com/oss/\r\n#############################################################################\r\n\r\n.
    $ZENHOME/bin/zenfunctions\r\n\r\nPRGHOME=$ZENHOME/Products/ZenWin\r\nPRGNAME=zenwin.py\r\nCFGFILE=$CFGDIR/zenwin.conf\r\n\r\ngeneric
    &quot;$@&quot;</p></div>\n\";i:4;s:2659:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"c\" style=\"font-family:monospace;\">$ gdb python\nGNU
    gdb 6.3.50<span style=\"color: #339933;\">-</span><span style=\"color: #0000dd;\">20050815</span>
    <span style=\"color: #009900;\">&#40;</span>Apple version gdb<span style=\"color:
    #339933;\">-</span><span style=\"color: #0000dd;\">962</span><span style=\"color:
    #009900;\">&#41;</span> <span style=\"color: #009900;\">&#40;</span>Sat Jul <span
    style=\"color: #0000dd;\">26</span> <span style=\"color:#800080;\">08</span><span
    style=\"color: #339933;\">:</span><span style=\"color: #0000dd;\">14</span><span
    style=\"color: #339933;\">:</span><span style=\"color: #0000dd;\">40</span> UTC
    <span style=\"color: #0000dd;\">2008</span><span style=\"color: #009900;\">&#41;</span>\nCopyright
    <span style=\"color: #0000dd;\">2004</span> Free Software Foundation<span style=\"color:
    #339933;\">,</span> Inc.\n<span style=\"color: #202020;\">GDB</span> is <span
    style=\"color: #000066;\">free</span> software<span style=\"color: #339933;\">,</span>
    covered by the GNU General Public License<span style=\"color: #339933;\">,</span>
    and you are\nwelcome to change it and<span style=\"color: #339933;\">/</span>or
    distribute copies of it under certain conditions.\n<span style=\"color: #202020;\">Type</span>
    <span style=\"color: #ff0000;\">&quot;show copying&quot;</span> to see the conditions.\n<span
    style=\"color: #202020;\">There</span> is absolutely no warranty <span style=\"color:
    #b1b100;\">for</span> GDB.  <span style=\"color: #202020;\">Type</span> <span
    style=\"color: #ff0000;\">&quot;show warranty&quot;</span> <span style=\"color:
    #b1b100;\">for</span> details.\n<span style=\"color: #202020;\">This</span> GDB
    was configured as <span style=\"color: #ff0000;\">&quot;i386-apple-darwin&quot;</span>...<span
    style=\"color: #202020;\">Reading</span> symbols <span style=\"color: #b1b100;\">for</span>
    shared libraries .... <span style=\"color: #202020;\">done</span>\n&nbsp;\n<span
    style=\"color: #009900;\">&#40;</span>gdb<span style=\"color: #009900;\">&#41;</span></pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">$ gdb python\r\nGNU gdb 6.3.50-20050815
    (Apple version gdb-962) (Sat Jul 26 08:14:40 UTC 2008)\r\nCopyright 2004 Free
    Software Foundation, Inc.\r\nGDB is free software, covered by the GNU General
    Public License, and you are\r\nwelcome to change it and/or distribute copies of
    it under certain conditions.\r\nType &quot;show copying&quot; to see the conditions.\r\nThere
    is absolutely no warranty for GDB.  Type &quot;show warranty&quot; for details.\r\nThis
    GDB was configured as &quot;i386-apple-darwin&quot;...Reading symbols for shared
    libraries .... done\r\n\r\n(gdb)</p></div>\n\";i:5;s:1129:\"\n<div class=\"wp_syntax\"
    style=\"position:relative;\"><table><tr><td class=\"code\"><pre class=\"c\" style=\"font-family:monospace;\"><span
    style=\"color: #009900;\">&#40;</span>gdb<span style=\"color: #009900;\">&#41;</span>
    set args <span style=\"color: #339933;\">/</span>Users<span style=\"color: #339933;\">/</span>cgibbons<span
    style=\"color: #339933;\">/</span>zenoss<span style=\"color: #339933;\">/</span>Products<span
    style=\"color: #339933;\">/</span>ZenWin<span style=\"color: #339933;\">/</span>zenwin.<span
    style=\"color: #202020;\">py</span> <span style=\"color: #339933;\">--</span>configfile<span
    style=\"color: #339933;\">=/</span>Users<span style=\"color: #339933;\">/</span>cgibbons<span
    style=\"color: #339933;\">/</span>zenoss<span style=\"color: #339933;\">/</span>etc<span
    style=\"color: #339933;\">/</span>zenwin.<span style=\"color: #202020;\">conf</span>
    run <span style=\"color: #339933;\">-</span>v10 <span style=\"color: #339933;\">-</span>c</pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">(gdb) set args /Users/cgibbons/zenoss/Products/ZenWin/zenwin.py
    --configfile=/Users/cgibbons/zenoss/etc/zenwin.conf run -v10 -c</p></div>\n\";i:6;s:1446:\"\n<div
    class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td class=\"code\"><pre
    class=\"c\" style=\"font-family:monospace;\"><span style=\"color: #009900;\">&#40;</span>gdb<span
    style=\"color: #009900;\">&#41;</span> run\nStarting program<span style=\"color:
    #339933;\">:</span> <span style=\"color: #339933;\">/</span>Users<span style=\"color:
    #339933;\">/</span>cgibbons<span style=\"color: #339933;\">/</span>zenoss<span
    style=\"color: #339933;\">/</span>bin<span style=\"color: #339933;\">/</span>python
    <span style=\"color: #339933;\">/</span>Users<span style=\"color: #339933;\">/</span>cgibbons<span
    style=\"color: #339933;\">/</span>zenoss<span style=\"color: #339933;\">/</span>Products<span
    style=\"color: #339933;\">/</span>ZenWin<span style=\"color: #339933;\">/</span>zenwin.<span
    style=\"color: #202020;\">py</span> <span style=\"color: #339933;\">--</span>configfile<span
    style=\"color: #339933;\">=/</span>Users<span style=\"color: #339933;\">/</span>cgibbons<span
    style=\"color: #339933;\">/</span>zenoss<span style=\"color: #339933;\">/</span>etc<span
    style=\"color: #339933;\">/</span>zenwin.<span style=\"color: #202020;\">conf</span>
    run <span style=\"color: #339933;\">-</span>v10 <span style=\"color: #339933;\">-</span>c</pre></td></tr></table><p
    class=\"theCode\" style=\"display:none;\">(gdb) run\r\nStarting program: /Users/cgibbons/zenoss/bin/python
    /Users/cgibbons/zenoss/Products/ZenWin/zenwin.py --configfile=/Users/cgibbons/zenoss/etc/zenwin.conf
    run -v10 -c</p></div>\n\";i:7;s:5589:\"\n<div class=\"wp_syntax\" style=\"position:relative;\"><table><tr><td
    class=\"code\"><pre class=\"c\" style=\"font-family:monospace;\"><span style=\"color:
    #339933;\">&gt;&gt;&gt;</span> lib.<span style=\"color: #202020;\">doit</span><span
    style=\"color: #009900;\">&#40;</span><span style=\"color: #009900;\">&#41;</span>\n&nbsp;\nProgram
    received signal EXC_BAD_ACCESS<span style=\"color: #339933;\">,</span> Could not
    access memory.\n<span style=\"color: #202020;\">Reason</span><span style=\"color:
    #339933;\">:</span> KERN_PROTECTION_FAILURE at address<span style=\"color: #339933;\">:</span>
    <span style=\"color: #208080;\">0x00000000</span>\n<span style=\"color: #208080;\">0x93ebe457</span>
    in __vfprintf <span style=\"color: #009900;\">&#40;</span><span style=\"color:
    #009900;\">&#41;</span>\n<span style=\"color: #009900;\">&#40;</span>gdb<span
    style=\"color: #009900;\">&#41;</span> where\n<span style=\"color: #339933;\">#0
    \ 0x93ebe457 in __vfprintf ()</span>\n<span style=\"color: #339933;\">#1  0x93ef2da7
    in vfprintf_l ()</span>\n<span style=\"color: #339933;\">#2  0x93f17fbb in printf
    ()</span>\n<span style=\"color: #339933;\">#3  0x003b9ffe in doit () at test.c:6</span>\n<span
    style=\"color: #339933;\">#4  0x0039476d in .LCFI1 () at /Users/cgibbons/src/zenoss/trunk/inst/build/ctypes-1.0.1/source/libffi/src/x86/darwin.S:81</span>\n<span
    style=\"color: #339933;\">#5  0x00394701 in ffi_call (cif=0xbffff1a8, fn=0x3b9fe6
    &lt;doit&gt;, rvalue=0xa0414584, avalue=0xbffff120) at /Users/cgibbons/src/zenoss/trunk/inst/build/ctypes-1.0.1/source/libffi/src/x86/ffi_darwin.c:249</span>\n<span
    style=\"color: #339933;\">#6  0x0038f21e in _CallProc (pProc=0x3b9fe6 &lt;doit&gt;,
    argtuple=0x15a030, flags=4097, argtypes=0x0, restype=0x21b600, checker=0x0) at
    source/callproc.c:665</span>\n<span style=\"color: #339933;\">#7  0x00389f02 in
    CFuncPtr_call (self=0x174880, inargs=0x15a030, kwds=0x0) at source/_ctypes.c:3357</span>\n<span
    style=\"color: #339933;\">#8  0x00007e12 in PyObject_Call (func=0x174880, arg=0x15a030,
    kw=0x0) at Objects/abstract.c:1795</span>\n<span style=\"color: #339933;\">#9
    \ 0x00080dcb in do_call [inlined] () at Python/ceval.c:3776</span>\n<span style=\"color:
    #339933;\">#10 0x00080dcb in PyEval_EvalFrame (f=0x209960) at Python/ceval.c:3591</span>\n<span
    style=\"color: #339933;\">#11 0x0008327f in PyEval_EvalCodeEx (co=0x1ac5e0, globals=0x173a50,
    locals=0x173a50, args=0x0, argcount=0, kws=0x0, kwcount=0, defs=0x0, defcount=0,
    closure=0x0) at Python/ceval.c:2741</span>\n<span style=\"color: #339933;\">#12
    0x00083547 in PyEval_EvalCode (co=0xbffff064, globals=0xbffff064, locals=0xbffff064)
    at Python/ceval.c:484</span>\n<span style=\"color: #339933;\">#13 0x000aae36 in
    PyRun_InteractiveOneFlags (fp=0xbffff064, filename=0xdb4a6 &quot;&lt;stdin&gt;&quot;,
    flags=0xbffff818) at Python/pythonrun.c:1287</span>\n<span style=\"color: #339933;\">#14
    0x000aaf73 in PyRun_InteractiveLoopFlags (fp=0xa04175e0, filename=0xdb4a6 &quot;&lt;stdin&gt;&quot;,
    flags=0xbffff818) at Python/pythonrun.c:706</span>\n<span style=\"color: #339933;\">#15
    0x000abe29 in PyRun_AnyFileExFlags (fp=0xa04175e0, filename=0xdb4a6 &quot;&lt;stdin&gt;&quot;,
    closeit=0, flags=0xbffff818) at Python/pythonrun.c:669</span>\n<span style=\"color:
    #339933;\">#16 0x000b5f8a in Py_Main (argc=0, argv=0xbffff8a4) at Modules/main.c:493</span>\n<span
    style=\"color: #339933;\">#17 0x00001d0b in _start ()</span>\n<span style=\"color:
    #339933;\">#18 0x00001c39 in start ()</span>\n<span style=\"color: #009900;\">&#40;</span>gdb<span
    style=\"color: #009900;\">&#41;</span></pre></td></tr></table><p class=\"theCode\"
    style=\"display:none;\">&gt;&gt;&gt; lib.doit()\r\n\r\nProgram received signal
    EXC_BAD_ACCESS, Could not access memory.\r\nReason: KERN_PROTECTION_FAILURE at
    address: 0x00000000\r\n0x93ebe457 in __vfprintf ()\r\n(gdb) where\r\n#0  0x93ebe457
    in __vfprintf ()\r\n#1  0x93ef2da7 in vfprintf_l ()\r\n#2  0x93f17fbb in printf
    ()\r\n#3  0x003b9ffe in doit () at test.c:6\r\n#4  0x0039476d in .LCFI1 () at
    /Users/cgibbons/src/zenoss/trunk/inst/build/ctypes-1.0.1/source/libffi/src/x86/darwin.S:81\r\n#5
    \ 0x00394701 in ffi_call (cif=0xbffff1a8, fn=0x3b9fe6 &lt;doit&gt;, rvalue=0xa0414584,
    avalue=0xbffff120) at /Users/cgibbons/src/zenoss/trunk/inst/build/ctypes-1.0.1/source/libffi/src/x86/ffi_darwin.c:249\r\n#6
    \ 0x0038f21e in _CallProc (pProc=0x3b9fe6 &lt;doit&gt;, argtuple=0x15a030, flags=4097,
    argtypes=0x0, restype=0x21b600, checker=0x0) at source/callproc.c:665\r\n#7  0x00389f02
    in CFuncPtr_call (self=0x174880, inargs=0x15a030, kwds=0x0) at source/_ctypes.c:3357\r\n#8
    \ 0x00007e12 in PyObject_Call (func=0x174880, arg=0x15a030, kw=0x0) at Objects/abstract.c:1795\r\n#9
    \ 0x00080dcb in do_call [inlined] () at Python/ceval.c:3776\r\n#10 0x00080dcb
    in PyEval_EvalFrame (f=0x209960) at Python/ceval.c:3591\r\n#11 0x0008327f in PyEval_EvalCodeEx
    (co=0x1ac5e0, globals=0x173a50, locals=0x173a50, args=0x0, argcount=0, kws=0x0,
    kwcount=0, defs=0x0, defcount=0, closure=0x0) at Python/ceval.c:2741\r\n#12 0x00083547
    in PyEval_EvalCode (co=0xbffff064, globals=0xbffff064, locals=0xbffff064) at Python/ceval.c:484\r\n#13
    0x000aae36 in PyRun_InteractiveOneFlags (fp=0xbffff064, filename=0xdb4a6 &quot;&lt;stdin&gt;&quot;,
    flags=0xbffff818) at Python/pythonrun.c:1287\r\n#14 0x000aaf73 in PyRun_InteractiveLoopFlags
    (fp=0xa04175e0, filename=0xdb4a6 &quot;&lt;stdin&gt;&quot;, flags=0xbffff818)
    at Python/pythonrun.c:706\r\n#15 0x000abe29 in PyRun_AnyFileExFlags (fp=0xa04175e0,
    filename=0xdb4a6 &quot;&lt;stdin&gt;&quot;, closeit=0, flags=0xbffff818) at Python/pythonrun.c:669\r\n#16
    0x000b5f8a in Py_Main (argc=0, argv=0xbffff8a4) at Modules/main.c:493\r\n#17 0x00001d0b
    in _start ()\r\n#18 0x00001c39 in start ()\r\n(gdb)</p></div>\n\";}"
author:
  login: chadwick
  email: dcgibbons@gmail.com
  display_name: chadwick
  first_name: Chad
  last_name: Gibbons
permalink: "/2009/03/19/getting-a-native-code-stack-trace-from-a-zenoss-daemon/"
---
Zenoss uses the Python programming language for the vast majority of its code, and all of the daemons and commands that run are Python scripts. Several daemons also make use of native code (i.e. code written in languages like C or C++ that must be compiled into object files and organized into libraries) to perform functions such as remote Windows and SNMP connectivity.

Occasionally, one of these daemons crash in these native libraries, and not in the actual Python code. When this happens, the Python interpreter is unable to produce a relatively friendly stack trace that it would for pure Python code. For example, a crash in a Python script would produce something that looks familiar to most programmers:

```
Traceback (most recent call last): File "test.py", line 5, in ? z = y / x ZeroDivisionError: integer division or modulo by zero
```

By contrast, if you have a crash inside of a native library you likely would not see anything more than `Bus Error` or a similar message, and often nothing at all -- the daemon process will just exit. For example, here we have a dynamic library written in C with a single function: `doit`. This function will attempt to access a `NULL` pointer when called, which results in the following output:

```
$ python -i Python 2.4.4 (#1, Feb 23 2009, 09:17:03) [GCC 4.0.1 (Apple Inc. build 5490)] on darwin Type "help", "copyright", "credits" or "license" for more information. \>\>\> from ctypes import \* \>\>\> from ctypes.util import \* \>\>\> lib = CDLL(find\_library('test')) \>\>\> lib.doit() Bus error
```

To get a stack trace from the native code, the Python interpreter must be run from the GNU debugger, or gdb. All of the Zenoss daemons share a common architecture in how they are started, so the process for running the daemon from within gdb will be similar no matter which daemon you use.

1. Determine your `ZENHOME` directory location by running `echo $ZENHOME` from the shell prompt. In the remainder of this example, we will assume it is set to `/Users/cgibbons/zenoss`
2. Pick the daemon you want to run. In this example, we will use zenwin -- the daemon responsible for monitoring the state of services on Windows devices.
3. Look at the actual daemon script:
```
$ cat $ZENHOME/bin/zenwin #! /usr/bin/env bash ############################################################################# # This program is part of Zenoss Core, an open source monitoring platform. # Copyright (C) 2007, Zenoss Inc. # # This program is free software; you can redistribute it and/or modify it # under the terms of the GNU General Public License version 2 as published by # the Free Software Foundation. # # For complete information please visit: http://www.zenoss.com/oss/ ############################################################################# . $ZENHOME/bin/zenfunctions PRGHOME=$ZENHOME/Products/ZenWin PRGNAME=zenwin.py CFGFILE=$CFGDIR/zenwin.conf generic "$@"
```
4. Run gdb in the python interpreter:
```
$ gdb python GNU gdb 6.3.50-20050815 (Apple version gdb-962) (Sat Jul 26 08:14:40 UTC 2008) Copyright 2004 Free Software Foundation, Inc. GDB is free software, covered by the GNU General Public License, and you are welcome to change it and/or distribute copies of it under certain conditions. Type "show copying" to see the conditions. There is absolutely no warranty for GDB. Type "show warranty" for details. This GDB was configured as "i386-apple-darwin"...Reading symbols for shared libraries .... done (gdb)
```
5. Set the program arguments. Note how the zenwin script above is used to build the actual argument string:
```
(gdb) set args /Users/cgibbons/zenoss/Products/ZenWin/zenwin.py --configfile=/Users/cgibbons/zenoss/etc/zenwin.conf run -v10 -c
```
6. Finally, run the daemon process within the debugger:
```
(gdb) run Starting program: /Users/cgibbons/zenoss/bin/python /Users/cgibbons/zenoss/Products/ZenWin/zenwin.py --configfile=/Users/cgibbons/zenoss/etc/zenwin.conf run -v10 -c
```

The daemon will then run as if it were started directly from the command-line. Any pdb trace statements will still be activated and you can use pdb commands as expected. But, once a native code crash is detected by the debugger, the gdb prompt will be provided and the gdb `where` command may be used to view the native code stack trace. For example, if we do this with our previous doit test, we'll see this output:

```
\>\>\> lib.doit() Program received signal EXC\_BAD\_ACCESS, Could not access memory. Reason: KERN\_PROTECTION\_FAILURE at address: 0x00000000 0x93ebe457 in \_\_vfprintf () (gdb) where #0 0x93ebe457 in \_\_vfprintf () #1 0x93ef2da7 in vfprintf\_l () #2 0x93f17fbb in printf () #3 0x003b9ffe in doit () at test.c:6 #4 0x0039476d in .LCFI1 () at /Users/cgibbons/src/zenoss/trunk/inst/build/ctypes-1.0.1/source/libffi/src/x86/darwin.S:81 #5 0x00394701 in ffi\_call (cif=0xbffff1a8, fn=0x3b9fe6 <doit>, rvalue=0xa0414584, avalue=0xbffff120) at /Users/cgibbons/src/zenoss/trunk/inst/build/ctypes-1.0.1/source/libffi/src/x86/ffi_darwin.c:249
#6 0x0038f21e in _CallProc (pProc=0x3b9fe6 <doit>, argtuple=0x15a030, flags=4097, argtypes=0x0, restype=0x21b600, checker=0x0) at source/callproc.c:665
#7 0x00389f02 in CFuncPtr_call (self=0x174880, inargs=0x15a030, kwds=0x0) at source/_ctypes.c:3357
#8 0x00007e12 in PyObject_Call (func=0x174880, arg=0x15a030, kw=0x0) at Objects/abstract.c:1795
#9 0x00080dcb in do_call [inlined] () at Python/ceval.c:3776
#10 0x00080dcb in PyEval_EvalFrame (f=0x209960) at Python/ceval.c:3591
#11 0x0008327f in PyEval_EvalCodeEx (co=0x1ac5e0, globals=0x173a50, locals=0x173a50, args=0x0, argcount=0, kws=0x0, kwcount=0, defs=0x0, defcount=0, closure=0x0) at Python/ceval.c:2741
#12 0x00083547 in PyEval_EvalCode (co=0xbffff064, globals=0xbffff064, locals=0xbffff064) at Python/ceval.c:484
#13 0x000aae36 in PyRun_InteractiveOneFlags (fp=0xbffff064, filename=0xdb4a6 "<stdin>", flags=0xbffff818) at Python/pythonrun.c:1287
#14 0x000aaf73 in PyRun_InteractiveLoopFlags (fp=0xa04175e0, filename=0xdb4a6 "<stdin>", flags=0xbffff818) at Python/pythonrun.c:706
#15 0x000abe29 in PyRun_AnyFileExFlags (fp=0xa04175e0, filename=0xdb4a6 "<stdin>", closeit=0, flags=0xbffff818) at Python/pythonrun.c:669
#16 0x000b5f8a in Py_Main (argc=0, argv=0xbffff8a4) at Modules/main.c:493
#17 0x00001d0b in _start ()
#18 0x00001c39 in start ()
(gdb)
</stdin></stdin></stdin></doit></doit>
```

If the native library was built with debugging symbols a nice programmer-friendly stack trace will be generated like in the above example. Here we can see exactly what line our `doit` function crashed at. Now the bug should be easy to find and fix, right?

