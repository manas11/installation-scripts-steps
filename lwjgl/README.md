1.  Introduction
LWJGL (Light-weight Java Game Library) provides access to the OpenGL, OpenAL, and OpenCL libraries from a Java application. LWJGL is an open-source project. The mother site is at http://lwjgl.org.

LWJGL is an alternative to JOGL.

2.  Setting Up LWJGL 2.9.1
Reference: LWJGL Wiki @ http://lwjgl.org/wiki/index.php?title=Main_Page#Getting_started.

Step 0: Install JDK
Install JDK, an IDE such as Eclipse/NetBeans or a programming text editor. You need a working Java programming environment to use LWJGL.

Step 1: Download & Install
Download the latest release of LWJGL binary (e.g., lwjgl-2.9.1.zip) from http://lwjgl.org ⇒ "Download". You may also download the source, javadoc, and applet.

Unzip the downloaded file "lwjgl-2.9.1.zip". The jar-files and native-libraries are kept in the "jar" and "native" sub-directories, respectively.

(Optional) Create a LWJGL binary directory, says "lwjgl-2.9.1" - I shall denote the binary directory as $LWJGL_HOME. Create sub-directories "jar", "lib", "src", "javadoc" under the $LWJGL_HOME. Copy the necessary jar-file, native libraries of your operating platform, and source-files into the appropriate sub-directories. For example, for Win32, copy all the jar-file into "jar"; the 32-bit libraries at "native\windows" into "lib"; and "lwjgl-source-2.9.1.zip" into "src" (no need to unzip). Unzip the javadocs downloaded into "javadoc".

Step 2a: Customize for Eclipse 4.3
Create a User Library: We shall first create a Eclipse's User Library called "lwjgl-2.9.1", which specifies the jar-files, native libraries (dll), javadoc, and source files for the JOGL API. All the JOGL projects can then include this user library in its build path.
From "Window" menu ⇒ Preferences ⇒ Java ⇒ Build Path ⇒ User Libraries ⇒ New ⇒ In "User library name", enter "lwjgl-2.9.1".
In "User Library" dialog ⇒ Select "lwjgl-2.9.1" ⇒ Add JAR... ⇒ Navigate to "$LWJGL_HOME\jar", and select "lwjgl.jar".
Expand the "lwjgl.jar" node, select "Native library location: (none)" ⇒ "Edit..." ⇒ External Folder... ⇒ select "$LWJGL_HOME\lib" (to provide the path for the native code dll's, such as "lwjgl.dll", and etc.).
You might need to repeat the above step for the other jar-files if they are used in your programs.
(Optional But Recommended) Expand the "lwjgl.jar" node again ⇒ Select "Javadoc location" ⇒ "Edit..."
Specify the javadoc's path (either file: or http:) in "Javadoc URL" if you use an unzip version of the javadoc.
Specify the javadoc's archive file (either zip or jar) in "Javadoc in archive" if you use a zip file.
Choose "Validate", which search for an "index.html" file.
This is needed for Eclipse to display javadoc information about classes and methods.
(Optional But Recommended) You may provide the source files by editing "Source attachment" ⇒ "Edit..." ⇒ "External File..." ⇒ Select the source file in zip form. Source is needed only if you are interested to debug into the JOGL source codes.
Include the User Library: For EACH JAVA PROJECT created that uses LWJGL, right-click on the project ⇒ Build Path ⇒ Add Libraries ⇒ Select "User Library" ⇒ Check "lwjgl-2.9.1".
Native Libraries: Native libraries refer to the JNI binaries (in the form of ".dll" (for Windows) or ".so" for Linux) in the JOGL's "lib" directory, e.g., "lwjgl.dll". These dll's are needed for proper operations.

Error in Native Libraries: If you receive an error message "SEVERE: java.lang.UnsatisfiedLinkError: no xxx in java.library.path", print out the entries in java.library.path via the following statement and check if $LWJGL_HOME\lib (which contains "lwjgl.dll") are included in one of the paths. "java.library.path" is supposed to mirror the PATH environment variable.

System.out.println(System.getProperty("java.library.path"));
You can also use the -Djava.library.path=lib-path VM command-line argument to specify the native-library's path.

Step 3b: Customize for NetBeans 7.0
Similar to Eclipse.

[TODO]

Step 3c: Customize for JDK/Editor
You need to modify two environment variables - CLASSPATH and PATH. Read "Environment Variables For Java Applications" on how to set these environment variables.

Modify the CLASSPATH environment variable to include the full-path filenames of "lwjgl.jar", for example,

prompt> set classpath=.;$LWJGL_HOME\lib\lwjgl.all.jar
where $LWJGL_HOME denotes the LWJGL installed directory. Take note that you should include the current working directory '.'.

Modified the PATH environment variable to include the full path to the LWJGL's "lib" directory for accessing the native libraries (e.g., "lwjgl.dll"), for example,

prompt> set path=$LWJGL_HOME\lib;......
3.  Getting Started with LWJGL 2.9.1
Reference: LWJGL's Tutorials @ http://lwjgl.org/wiki/index.php?title=Main_Page.

Read:

LWJGL Basics 1 (The Display)
LWJGL Basics 2 (Input)
LWJGL Basics 3 (The Quad)
LWJGL Basics 4 (Timing)
LWJGL Basics 5 (Fullscreen)
Slick-Util Library - Introduction
Slick-Util Library - Part 1 - Loading Images for LWJGL
Slick-Util Library - Part 2 - Loading Sounds for LWJGL
Slick-Util Library - Part 3 - TrueType Fonts for LWJGL
CES

LWJGL mother site @ http://lwjgl.org. LWJGL's Wiki @ http://lwjgl.org/wiki/index.php?title=Main_Page.
OpenGL mother site @ www.opengl.org.
Nehe OpenGL tutorials @ http://nehe.gamedev.net.
OpenGL Programming Guide (Red book); OpenGL Superbible (Blue book)