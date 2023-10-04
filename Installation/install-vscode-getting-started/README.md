o Get Started in Java Programming (I assume that you have some basic knowledge of programming and Java):

Setup Workspace: Create a folder, say "VSCodeJavaTest". VS Code goes by folders (and sub-folders and files), instead of project or workspace.
Launch VS Code ⇒ Select "File" menu ⇒ "Open Folder..." ⇒ Select the above folder (as your project workspace).
Create a new Class: Point your mouse over the project name ⇒ Click on the icon "New File" ⇒ Enter "Hello.java" ⇒ A new file appears on the editor pane.
Write a hello-word: In the editor pane, enter a hello-world Java program as follow. You can try out the IntelliSense and the code snippets:
Enter "class", and scroll down to the 2nd item with a box icon, indicating a code snippet. Select this code snippet. VS Code's IntelliSense will expand to the class definition.
Enter "main" and select the code snippet (with box icon). VS Code will expand to the main() method.
Enter "sysout" and select the code snippet. VS Code will expand to System.out.println(). Enter some codes.
/**
 * Hello
 */
public class Hello {
    public static void main(String[] args) {
      int i = 8899;
      String msg = "hello, ";
      System.out.println("hello, world");
      System.out.println("hello, again");
      System.out.println(msg + i);
   }
}
Run the program:
Push the "Run" button above the main() method. You can check the output on the "Terminal" pane at the bottom.
You can also run your program by entering your own commands in the "Terminal" (In windows, a Powershell by default - but you can also switch to the familiar CMD), e.g.,
PS C:\xxx\VSCodeJavaTest> javac Hello.java    // Compile Java program
PS C:\xxx\VSCodeJavaTest> java Hello          // Run the compiled class file
......
PS C:\xxx\VSCodeJavaTest> java Hello.java     // Compile and run Java source file
......
Debug the program: To debug the program, first set a breakpoint by clicking on the left-margin of the chosen statement (a soild red dot appears). Push the "Debug" button above the main() method. You can then "Step Over" (or "Continue" or "Stop" or "Step Into" or "Step Out') the codes via the buttons in the pop-up toolbar. You can check the output at the "Terminal" pane; and inspect or watch variables in the "Run and Debug" pane on the left.
