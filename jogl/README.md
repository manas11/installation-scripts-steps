Downloading the latest stable version
Go to this page and download the all-in-one 7z archive file:

jogamp-all-platforms.7z
Using the 7z jogamp-all-platforms archive
After inflating the file with 7zip, you will have the general directory structure:

<jogamp-all-platforms>/
<jogamp-all-platforms>/etc/test.sh
<jogamp-all-platforms>/etc/test.bat
<jogamp-all-platforms>/etc/test_dbg.sh
<jogamp-all-platforms>/etc/test_dbg.bat
<jogamp-all-platforms>/jar/<module>.jar
<jogamp-all-platforms>/jar/<module>-natives-<os.and.arch>.jar
<jogamp-all-platforms>/lib/
<jogamp-all-platforms>/<module>-java-src.zip*
Legend:

os.and.arch
module: gluegen, joal, jogl or jocl
Now you can test the archive as described in runtime version check and runtime debug test.

If anything doesn't work as predicted, please follow our bugreport guide.

While keeping the above directory structure as-is, you can go ahead and

add the non-native JAR files to your CLASSPATH (IDE, manual, ..)
attach the java-source files to the non-native JAR files (IDE)
.. now you are set to start using JogAmp module in your project.

The above is detailed in Eclipse Project and Eclipse User Library.

Downloading the latest aggregated autobuild
Got to this page and navigate into the first folder, which shall be the latest aggregated autobuild.

Then navigate further down to archive and download the file jogamp-all-platforms.7z.

For example, on 13-Mar-2013 20:19 CET, the latest aggregated autobuild was:

https://jogamp.org/deployment/archive/master/gluegen_646-joal_408-jogl_930-jocl_756/archive/jogamp-all-platforms.7z
Now you can continue here.

Downloading the latest automatic build
For the latest automatic build, we have to download gluegen and jogl separately.

First, go to this page and click on the most recent gluegen-b* directory. Then download one of these files for each platform you're developing on:

32-bit Windows: gluegen-2.0-bvvv-20yymmdd-windows-i586.7z
64-bit Windows: gluegen-2.0-bvvv-20yymmdd-windows-amd64.7z
32/64-bit Mac OS X: gluegen-2.0-bvvv-20yymmdd-macosx-universal.7z
32-bit Linux: gluegen-2.0-bvvv-20yymmdd-linux-i586.7z
64-bit Linux: gluegen-2.0-bvvv-20yymmdd-linux-amd64.7z
32-bit Solaris: gluegen-2.0-bvvv-20yymmdd-solaris-i586.7z
64-bit Solaris: gluegen-2.0-bvvv-20yymmdd-solaris-amd64.7z
Then, go back to this page and click on the most recent jogl-b* directory. Then download one of these files for each platform you're developing on:

32-bit Windows: jogl-2.0-bvvv-20yymmdd-windows-i586.7z
64-bit Windows: jogl-2.0-bvvv-20yymmdd-windows-amd64.7z
32/64-bit Mac OS X: jogl-2.0-bvvv-20yymmdd-macosx-universal.7z
32-bit Linux: jogl-2.0-bvvv-20yymmdd-linux-i586.7z
64-bit Linux: jogl-2.0-bvvv-20yymmdd-linux-amd64.7z
32-bit Solaris: jogl-2.0-bvvv-20yymmdd-solaris-i586.7z
64-bit Solaris: jogl-2.0-bvvv-20yymmdd-solaris-amd64.7z
Note that these automatic builds may not have passed all the regression tests. You can check the test results on the build server to make sure you're not downloading a broken build.

Native JARs vs. native library files
JOGL uses native libraries to interface with each platform's OpenGL library. You can either download these native libraries wrapped up in JAR files (the "native JARs" option), or you can download them as separate .dll/.so/.jnilib files (the "native library files" option).

When using native JARs, JOGL automatically unzips the native JARs at startup into a temporary directory, then loads the resulting .dll/.so/.jnilib files from there. When using native library files, JOGL just loads them directly from where they sit, with no unzipping.

Using native JARs is usually easiest, since there are fewer files to manage and it allows different platforms' native library files to coexist in the same directory. Only use the native library files directly if you need fine control over native library file placement or if your app doesn't have permissions to create temporary directories.

See JogAmp JAR File Handling, for details on native JAR files and custom JAR bundling.

Unzipping the files
Unzip all the downloaded files with 7zip. An unzipped file has this general directory structure:

<archive>/
<archive>/jar/
<archive>/lib/
<archive>/<module>-java-src.zip*
Now you may copy the required JARs out of each jar folder and the native library files (if you're using them) out of each lib folder. For a full desktop installation using native JARs, here are the files you need. Note that the native JAR names are different for each platform, so you can use some or all of the native JARs together to create a multi-platform installation.

64-bit Windows	64-bit Linux	32/64-bit Mac
gluegen-rt.jar	gluegen-rt.jar	gluegen-rt.jar
jogl-all.jar	jogl-all.jar	jogl-all.jar
gluegen-java-src.zip	gluegen-java-src.zip	gluegen-java-src.zip
jogl-java-src.zip	jogl-java-src.zip	jogl-java-src.zip
gluegen-rt-natives-windows-amd64.jar	gluegen-rt-natives-linux-amd64.jar	gluegen-rt-natives-macosx-universal.jar
jogl-all-natives-windows-amd64.jar	jogl-all-natives-linux-amd64.jar	jogl-all-natives-macosx-universal.jar

32-bit Windows	32-bit Linux
gluegen-rt.jar	gluegen-rt.jar
jogl-all.jar	jogl-all.jar	
gluegen-java-src.zip	gluegen-java-src.zip	
jogl-java-src.zip	jogl-java-src.zip	
gluegen-rt-natives-windows-i586.jar	gluegen-rt-natives-linux-i586.jar
jogl-all-natives-windows-i586.jar	jogl-all-natives-linux-i586.jar

For a full desktop installation using native library files, here are the files you need. Note that the native library files have the same names for 32-bit and 64-bit platforms, so 32-bit and 64-bit platforms can't coexist in one installation.
Windows	Linux	Mac
gluegen-rt.jar	gluegen-rt.jar	gluegen-rt.jar
jogl-all.jar	jogl-all.jar	jogl-all.jar
gluegen-java-src.zip	gluegen-java-src.zip	gluegen-java-src.zip
jogl-java-src.zip	jogl-java-src.zip	jogl-java-src.zip
gluegen-rt.dll	libgluegen-rt.so	libgluegen-rt.jnilib
jogl_desktop.dll	libjogl_desktop.so	libjogl_desktop.jnilib
nativewindow_awt.dll	libnativewindow_awt.so	libnativewindow_awt.jnilib
nativewindow_win32.dll	libnativewindow_x11.so	libnativewindow_macosx.jnilib
newt.dll	libnewt.so	libnewt.jnilib
Maven
Alternatively, the Jogamp packages are available through Maven.

See the maven instructions for a guide to using Jogamp in Maven projects.