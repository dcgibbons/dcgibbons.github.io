---
title: Project Dependencies and Include Files in Xcode
date: 2012-09-22 22:59:22.000000000 -07:00
type: post
categories: [software development, technology]
tags: [example, githnub, header files, howto, include files, iOS, objc,
objective-c, source code, xcode]
author: chadwick
permalink: "/2012/09/22/project-dependencies-and-include-files-in-xcode/"
---
I have read a lot of how-to guides on blogs over the past few years on how to
set it up Xcode sub-projects so you can build your project, a dependent
sub-project, and have all the header files and libraries be found. Invariably,
this involves changing Xcode project settings both in your main application,
and in the sub-project so that everything works out. This is wrong!

The proper way to build sub-projects is that a user of your sub-project does
not have to do anything but:

1. Include the .xcodeproj project file.
2. Add the project to the top project's dependencies.
3. Link against the proper library.

If you are having to do more, then the sub-project was not designed correctly.

As it turns out, Xcode already does this right, but the proliferation of
how-to guides usually get it wrong and make developers go through more hoops
than they need to. Let's walk through doing it the right way. **Note:** this
post was written with Xcode 4.4 and 4.5 in mind, so older versions may have
had different ways of doing things.

For the purposes of this example we need something simple. Let's just write a
Hello World application that uses an external framework to get the text - it
will demonstrate all that we need. Also, we will only cover projects targeted
for iOS within this post, but look for a follow-up post that discusses
extending these projects to work on Mac OS X as well.

## The Framework

Our framework will not do much. We will provide a single public function,
`sayHello`, that will format a "Hello, World" style message. We are after
proving the project functionality, not implementing a useful framework.

1. Create a new Xcode project called HelloFramework. Choose the Cocoa Touch Static Library option for the project type.
2. Change the HelloFramework.h file to have the following content:
   ```
   #import <foundation>

   extern NSString* sayHello(const NSString* who);
   </foundation>
   ```

3. Change the HelloFramework.m file to have the following content:
   ```
   #import "HelloFramework.h"

   NSString* sayHello(const NSString* who) {
     return [NSString stringWithFormat:@"Hello there, %@!", who];
   }
   ```
4. Go to the project's settings and choose Build Phases section.
5. Press the `Add Build Phase` button on the bottom of the screen and select the `Add Copy Headers` option.
6. Now that the Copy Headers section appears in the Build Phases section, you can press the add button and add the HelloFramework.h header file to the public section. By doing this, we are telling Xcode we want this header file to be copied to the proper location so that users of the framework can access it.
7. Finally, build the framework and correct any syntax errors you may have created.

## The App

Now we'll create the top-level application that uses the framework.

1. Create a new Xcode project called HelloApp. Pick the Empty Application option, and be sure to select the Include Unit Tests option.
2. Add the HelloFramework sub-project to the new application by dragging the .xcodeproj file in the sub-project underneath the HelloApp project. You can also use the Add Files to "HelloApp"... menu option.
  1. TIP: It doesn't matter where this other project is located. I like to use git submodules in my projects in a `deps` subdirectory, but it simply doesn't matter.
  2. TIP: If you need to relocate where that .xcodeproj file is because you have moved the project, or on a different system, examine the Identity section in the Utilities view. There are multiple options for how to find that file, and you can always relocate it easily with the disclosure arrow.
3. Add the HelloFramework as a target dependency of the application in the Build Phases section of the main project's settings. Do this for both the main application target and for HelloAppTests, as we'll use the unit tests to confirm our project is working.
4. Add `libHelloFramework.a` to both targets.
5. Change `HelloAppTests.m`to have the following content:
   ```
   #import <helloframework>

   #import "HelloAppTests.h"

   @implementation HelloAppTests

   - (void)testBob
   {
       NSString* actual = sayHello(@"Bob");
       NSString* expected = @"Hello there, Bob!";
       STAssertEqualObjects(actual, expected, @"hello string did not match");
   }

   @end</helloframework>
   ```

**Note:** our framework's include file was included using angle brackets, not quotes. This is key.

6. That is it - now build for testing and execute the unit tests. And that is all you have to do to use sub-projects properly in Xcode.

## How it Works

When you perform a build in Xcode, output files are located
in `~/Library/Developer/Xcode/DerivedData/` by default. Within that
directory is a directory for each of your projects with a randomized suffix,
and inside of each project's directory are all the build artifacts created by
Xcode.

All the useful stuff is found in in the `Build/Products/` sub-directory. This
corresponds directly to the `BUILT_PRODUCTS_DIR` build setting. For this
example, on my system, the `BUILT_PRODUCTS_DIR` directory is as follows:
`~/Library/Developer/Xcode/DerivedData/HelloApp-aknvzjzfhxvwbkgvbzzkobpheygd/Build/Products/Debug-iphonesimulator/`
and contains the following contents:

```
total 16
 0 drwxr-xr-x 9 chadwick staff 306 Sep 22 20:43 ./ 
 0 drwxr-xr-x@ 3 chadwick staff 102 Sep 22 20:43 ../ 
 0 drwxr-xr-x 9 chadwick staff 306 Sep 22 20:43 HelloApp.app/ 
 0 drwxr-xr-x 3 chadwick staff 102 Sep 22 20:43 HelloApp.app.dSYM/ 
 0 drwxr-xr-x 5 chadwick staff 170 Sep 22 20:43 HelloAppTests.octest/ 
 0 drwxr-xr-x 3 chadwick staff 102 Sep 22 20:43 HelloAppTests.octest.dSYM/ 
 0 drwxr-xr-x 3 chadwick staff 102 Sep 22 20:43 include/ 
16 -rw-r--r-- 1 chadwick staff 4112 Sep 22 20:43 libHelloFramework.a 
 0 drwxr-xr-x 3 chadwick staff 102 Sep 22 20:43 usr/
```

You will notice two interesting sub-directories here: `include` and `usr`. It
turns out that the `usr` sub-directory expands out to be `usr/local/include`,
and this is where all of the header files that are marked as Public and
Private are copied to, assuming you added the Copy Headers build phase to your
project.

You will notice if you look in the `include` sub-directory that the
`HelloFramework.h` file is also located here - this is the one that causes all
the trouble. If a framework isn't built properly, with the Public headers and
the Copy Headers build phase, then an enterprising developer will go and find
the header file they are missing. Invariably, it winds up as a blog post
instructing the rest of us to set `PUBLIC_HEADERS_FOLDER_PATH =
include/$(PROJECT_NAME)` in our top-level project to get things to work, along
with other settings in order to get the Archiving feature to work. That does
do it, sort-of, but it isn't the way Xcode was designed to be used, and it's
an extra step that simply isn't necessary.

If your framework uses Public headers properly, and uses the Copy Headers
build phase, then your instructions for your users will be nothing more than
to include the framework library as a dependency. Why over complicate things?

For those wishing to know more about the header visibility in Xcode, be sure
to look up the [Setting Visibility of a
Header](http://developer.apple.com/library/mac/#recipes/xcode_help-project_editor/Articles/Setting%20the%20Role%20of%20a%20Header%20File.html
"Project Editor Help: Setting Visibility of a Header File") file section in
the Xcode documentation. It spells it out very clearly.

If you want to browse the source to the example project discussed here, see
the source
at [https://github.com/dcgibbons/HelloApp](https://github.com/dcgibbons/HelloApp
"HelloApp project on GitHub")

