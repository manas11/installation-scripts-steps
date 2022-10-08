Step 1: Check if JDK has been Pre-Installed
To check if JDK has been installed, open a "Terminal" (Search "Terminal"; or Finder ⇒ Go ⇒ Utilities ⇒ Terminal) and issue this command:

javac -version
If a JDK version number is returned (e.g., JDK x.x.x), then JDK has already been installed. If the JDK version is prior to 11, proceed to Step 2 to install the latest JDK; otherwise, proceed to "Step 3: Write a Hello-world Java program".
If message "command not found" appears, JDK is NOT installed. Proceed to the "Step 2: Install JDK".
If message "To open javac, you need a Java runtime" appears, select "Install" and follow the instructions to install JDK. Then, proceed to "Step 3: Write a Hello-world Java program".
Step 2: Download JDK
Goto JDK (or Java SE) download site @ https://www.oracle.com/java/technologies/javase-downloads.html.
Under "Java SE Development Kit 17.0.{x} downloads".
Select "macOS" ⇒ Download the "x64 Installer" (e.g., "jdk-17_windows-x64_bin.exe" - about 152MB).
Under "Oracle JDK", click "JDK Download".
Download the "x64 DMG installer" (e.g, jdk-17_macos-x64_bin.dmg - about 168MB (I am assuming that you are using Intel processor, not ARM processor. Mac is moving to ARM processor.)
Step 3: Install JDK/JRE
Double-click the downloaded Disk Image (DMG) file. Follow the screen instructions to install JDK/JRE.
Eject the DMG file.
To verify your installation, open a "Terminal" and issue these commands.
// Display the JDK version
javac -version
javac 17.0.{x}
 
// Display the JRE version
java -version
java version "17.0.{x}"
......
 
// Display the location of Java Compiler
which javac
/usr/bin/javac
 
// Display the location of Java Runtime
which java
/usr/bin/java
Step 3: Write a Hello-World Java Program
Create a directory called "myProject" under your "home" directory (Launch "Finder" ⇒ "Go" ⇒ "Home"; Select "File" ⇒ "New Folder" ⇒ "myProject").
In macOS/Unix, the "home" directory of the current user can be referenced as "~". Hence, this new directory can be referenced as "~/myProject".
Use a programming text editor (such as Sublime Text or Atom) to input the following source code and save as "Hello.java" under the directory "~/myProject".
(If you use macOS's default text editor "TextEdit" (NOT recommended), you need to open a new file ⇒ choose "Format" ⇒ "Make Plain Text" ⇒ Enter the source code ⇒ Save as "Hello.java".)
/*
 * My First Java program to say Hello
 */
public class Hello {   // Save as "Hello.java" under "~/myProject"
   public static void main(String[] args) {
      System.out.println("Hello, world from Mac!");
   }
}
Step 4: Compile and Run the Hello-World Java Program
MacJavaCompile.png
To compile the source code "Hello.java", open a new "Terminal" ("Go" ⇒ "Utilities" ⇒ "Terminal") and issue these commands (as illustrated):
// Change Directory (cd) to where "Hello.java" resides
cd ~/myProject
 
// Check if "Hello.java" exists using list (ls) command
ls
Hello.java   ......
 
// Compile "Hello.java" using JDK compiler "javac"
javac Hello.java
// If error message appears, correct your source code and re-compile
 
// Check for the compiled output "Hello.class"
ls
Hello.class   Hello.java   ......
To run the Hello-world, invoke the Java Runtime "java" as follows:
java Hello
Hello, world from Mac!
