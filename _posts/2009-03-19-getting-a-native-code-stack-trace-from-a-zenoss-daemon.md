---
title: Getting a Native Code Stack Trace from a Zenoss Daemon
date: 2009-03-19 15:35:05.000000000 -07:00
type: post
categories: [jobs, zenoss]
tags: [c, debug, python]
author: chadwick
permalink: "/2009/03/19/getting-a-native-code-stack-trace-from-a-zenoss-daemon/"
---
Zenoss uses the Python programming language for the vast majority of its code,
and all of the daemons and commands that run are Python scripts. Several
daemons also make use of native code (i.e. code written in languages like C or
C++ that must be compiled into object files and organized into libraries) to
perform functions such as remote Windows and SNMP connectivity.

Occasionally, one of these daemons crash in these native libraries, and not in
the actual Python code. When this happens, the Python interpreter is unable to
produce a relatively friendly stack trace that it would for pure Python code.
For example, a crash in a Python script would produce something that looks
familiar to most programmers:

```
Traceback (most recent call last): File "test.py", line 5, in ? z = y / x ZeroDivisionError: integer division or modulo by zero
```

By contrast, if you have a crash inside of a native library you likely would
not see anything more than `Bus Error` or a similar message, and often nothing
at all -- the daemon process will just exit. For example, here we have a
dynamic library written in C with a single function: `doit`. This function
will attempt to access a `NULL` pointer when called, which results in the
following output:

```
$ python -i Python 2.4.4 (#1, Feb 23 2009, 09:17:03) [GCC 4.0.1 (Apple Inc. build 5490)] on darwin Type "help", "copyright", "credits" or "license" for more information. \>\>\> from ctypes import \* \>\>\> from ctypes.util import \* \>\>\> lib = CDLL(find\_library('test')) \>\>\> lib.doit() Bus error
```

To get a stack trace from the native code, the Python interpreter must be run
from the GNU debugger, or gdb. All of the Zenoss daemons share a common
architecture in how they are started, so the process for running the daemon
from within gdb will be similar no matter which daemon you use.

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

The daemon will then run as if it were started directly from the command-line.
Any pdb trace statements will still be activated and you can use pdb commands
as expected. But, once a native code crash is detected by the debugger, the
gdb prompt will be provided and the gdb `where` command may be used to view
the native code stack trace. For example, if we do this with our previous doit
test, we'll see this output:

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

If the native library was built with debugging symbols a nice
programmer-friendly stack trace will be generated like in the above example.
Here we can see exactly what line our `doit` function crashed at. Now the bug
should be easy to find and fix, right?

