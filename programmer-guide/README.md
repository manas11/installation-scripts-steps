1.  File System
Files and Directories
Files are organized in directories (aka folders). The directories are organized in a hierarchical tree structure, starting from the root directory. A directory may contain sub-directories and files. A sub-directory may contain sub-sub-directories and files.

Root Directory (/)
A file is identified via the directories and filename, e.g., "/usr/lib/jvm/jdk1.7.0_07/bin/javac". The leading "/" (forward slash) denotes the root directory. The sub-directories are also separated by a "/".

There is only one root directory for the entire Unix/macOS's file system. Hard drives are mounted somewhere under the root directory.

Notes: Windows use "\" (back slash) as the directory separator, and may contain multiple root directories - one for each drive (e.g., c:\, d:\).

Home Directory (~)
Unix is a multi-user operating system (although most of you, in particular the Mac users, use it as a single-user personal computer). Each user on the system is allocated a directory for storing his files, known as home directory. The users' home directories are allocated under /Users (for macOS), or /home (for Ubuntu), with a sub-directory name the same as the username, e.g. /Users/peter, /Users/paul in macOS; or /home/peter, /home/paul in Ubuntu.

Your home directory (/Users/<username>) contains sub-directories such as Downloads, Documents. Their full filenames are /Users/<username>/Downloads, /Users/<username>/Documents, respectively.

You can use a special notation "~" to denote your home directory. In other words, ~/Downloads is the same as /Users/<username>/Downloads.

Pathname and Filename
To reference a file, you need to provide the pathname (directory and sub-directories names) and the filename. For example, in "/usr/lib/jvm/jdk1.7.0_07/bin/javac", the pathname is "/usr/lib/jvm/jdk1.7.0_07/bin/" and the filename is "javac".

The pathname can be specified in two ways:

Absolute Pathname: An absolute path begins from the root directory. That is, it starts with a "/" followed by all the sub-directories, separated with "/" leading to the file, e.g., "/usr/lib/jvm/jdk1.7.0_07/bin/".
An absolute path can also begin with the current user's home directory (starts with "~"). For example, "~/Downloads/jdk/" is the same as "/Users/<yourname>/Downloads/jdk/" in macOS.
Relative Pathname: A relative path is relative to the so-called current working directory. A relative path does NOT begin with "/" or "~". For example, if the current working directory is "/usr/lib/jvm/", then the relative pathname "jdk1.7.0_07/bin/" refers to "/usr/lib/jvm/jdk1.7.0_07/bin/".
Case Sensitivity
Unix/macOS system is case sensitive, a rose is NOT a Rose, and is NOT a ROSE.

2.  Command-line Interface "Terminal"
Programmers use a command-line interface (CLI) to issue text-commands to the Operating System (OS), instead of clicking on a Graphical User Interface (GUI). This is because command-line inerface is much more powerful and flexible than the graphical user interface.

The Terminal application is a command-line Interface (or shell). By default, the Terminal in Ubuntu and macOS runs the so-called bash shell, which supports a set of commands and utilities; and has its own programming language for writing shell scripts.

To launch a Terminal:

In macOS: Open "Finder" ⇒ Go ⇒ Utilities ⇒ Select "Terminal". Drag the "Terminal" to your dock since you need to use it frequently.
In Ubuntu: Open "Dash" ⇒ type "Terminal"; or choose "Applications" lens ⇒ Installed ⇒ Select "Terminal". Drag the "Terminal" to your Launcher since you need to use it frequently.
A Terminal displays a command prompt ending with a "$" sign, in the form of:

In macOS: "ComputerName:CurrentDirectory Username$"
In Linux/Ubuntu: "Username@ComputerName:CurrentDirectory$"
You can enter commands after the command prompt. For example, enter "pwd" to print the current working directory:

<prompt>$ pwd
.......
In this article, I shall denote the command prompt simply as "$".

2.1  Print Current Working Directory "pwd" Command
The Terminal session maintains a so-called current working directory. All relative pathnames/filenames are relative to the current working directory. To display the current directory, issue command "pwd" (print working directory):

// Print Current Working Directory
pwd
......
When a Terminal is launched, it sets the initial working directory to the home directory of the current login user (denoted as "~").

The current working directory is often included as part of the command prompt.

2.2  Change Directory "cd" Command
To change the current working directory, issue command "cd <new-pathname>". You can specify new-pathname in two ways: absolute or relative. As explained earlier, an absolute path begins with a "/" (root directory) or "~" (home directory); whereas a relative path is relative to the current working directory and does NOT begin with "/" or "~". For example,

cd /                // Change directory (absolute) to the root
cd /usr/local       // Change directory (absolute) to "/usr/local"
cd mysql            // Change directory (relative) to mysql of the current directory
cd myproject/bin    // Change directory (relative) to myproject/bin of the current directory
You can cd in multiple stages (e.g., one cd for each sub-directory), or cd in a single stage with the full pathname.

cd /         // "/"
cd usr       // "/usr"
cd local     // "/usr/local"
cd mysql     // "/usr/local/mysql"
cd bin       // "/usr/local/mysql/bin"
 
// Same As
cd /usr/local/mysql/bin
Root (/), Home (~), Parent (..), Current (.) Previous (-) Directory
You can use "/" to denote the root; "~" to refer to your home directory; ".." (double-dot) to refer to the parent directory; "." (single-dot) to refer to the current directory; and "-" (dash) to refer to the previous directory. For example,

cd ~            // Change directory to the home directory of the current user
cd              // same as above, default for "cd" is home directory
cd ~/Documents  // Change directory to the sub-directory "Documents" of the home directory of the current user
cd ..           // Change directory to the parent directory of the current working directory
cd -            // Change directory to the previous working directory (OLDPWD)
Setting proper working directory can greatly simplify your work. For example, to compile a Java program called "Hello.java" in "~/myproject/java/":

Set the working directory to "~/myproject/java/", and reference the file with filename only (without the path):
cd ~/myproject/java  // Set the working directory
javac Hello.java     // Filename only, in current directory
You can also refer to a file with its full pathname in any working directory, but you will have a hard time finding the output file.
// Any working directory
javac ~/myproject/java/Hello.java   // Using fully-qualified filename
2.3  List Directory "ls" Command
You can use command ls to list the contents of the current working directory, e.g.,

// List contents of current working directory in short format
ls
Desktop    Downloads         Music     Public     Videos
Documents  examples.desktop  Pictures  Templates
 
// List in "long" format
ls -l
total xx
drwxr-xr-x 2 myuser myuser 1024 Mar 22 21:32 Desktop
drwxr-xr-x 2 myuser myuser 1024 Mar 22 21:32 Documents
drwxr-xr-x 2 myuser myuser 1024 Mar 22 21:32 Downloads
-rw-r--r-- 1 myuser myuser 8445 Mar 22 17:30 examples.desktop
......
Wildcard *
You can list selected files using wildcard *, which matches 0 or more (any) characters. For examples,

ls *.java     // List files ending with ".java" in short format (default)
ls -l *.java  // List files ending with ".java" in long format
ls -ld my*    // List files and directories beginning with "my" in long format
2.4  (macOS) Graphical Interface - Finder
You could, of course, view the contents of a directory using a File Manager (such as "Finder" in macOS) more conveniently.

In macOS, to goto and view a directory, launch "Finder" ⇒ "Go" ⇒ "Go to Folder" ⇒ enter the directory name such as / (for root), /usr/local, ~ (home directory), and etc.

[TODO] How to get the full path of a file from Finder?

2.5  (Ubuntu) Graphical Interface
[TODO] more

2.6  Shortcut Keys in Terminal (Bash) - IMPORTANT
Previous Commands in Command History: You can use the up/down arrow keys to retrieve the previous/next command in the command history.

Auto-Complete: You can type the first few characters for the pathname or filename, and press TAB key to auto-complete.

Copy/Paste:

In macOS: use Cmd+C and Cmd+V.
In Ubuntu: use Shift+Ctrl+C and Shift+Ctrl+V. (The Ctrl+C is used as interrupt signal to break a program, by default.)
Moving the Command-Line Cursor: In "Terminal", you CANNOT use mouse pointer to move the command-line cursor. Instead, you need to use Left/Right-Arrow, Backspace or Delete keys to move the command-line cursor.

These are the various ways of moving the command-line cursor (To Verify):

Left/Right Arrow Key: Move the cursor one character to the left/right.
Backspace/Delete Key: delete the previous/current character unde the cursor.
ESC Key: Clear command-line.
Home/End Keys: Move to the begin/end of command line.
Ctrl + Left/Right-Arrow Key: Move one "word" to the left/right.
3.  Keyboard Shortcuts (for macOS)
[TODO]

4.  Processes
You can use GUI applications to view all running processes and terminate a particular process (similar to "Task Manager" in Windows).

In macOS: launch "Activity Monitor" (Under /Applications/Utilities) and select "All Processes".
In Ubuntu: launch "System Monitor" (search from Dash) and select "Processes".
5.  Programming Text Editors
To learn a new programming language, you could begin with a graphical Source-Code Editor, with provides syntax highlighting. But you must switch over to an Integrated Development Environment (IDE), which provides a graphic debugger, when you are working on complex programs and projects to improve your productivity.

Read "Source-Code Editors and IDE".

macOS's Default Text Editor "TextEdit"
To use the macOS's default text editor "TextEdit" for programming, you need to choose the option "Make Plain Text" (under "Format"), before editing/saving your file. TextEdit is NOT a programming text editor, as it does not provide syntax highlighting. You should NOT use it for programming!