Java Unit Testing - JUnit & TestNG
1.  Introduction to Unit Testing Framework
The various type of software testings include:

Unit Test: Test individual component/class in isolation.
Integration Test: Test a group of associated components/classes.
Acceptance Test (or Functional Test): operate on a fully integrated system, testing against the user interface (e.g., HTML for browser or XML/JSON for web services).
Regression Test: Tests to ensure the a change (such as enhancement, patches or configuration change) does not break the system or introduce new faults.
Unit Testing is concerned about testing individual programs/classes to ascertain that each program/class runs as per specification. Prior to the arrival of "unit testing framework", programmers tends to write test expressions which print to the console or a trace file (the amount of output is sometimes controlled by a trace-level or debug-level flag). This approach is not satisfactory because it requires human judgment to analyze the results produced. Too many print statements cause the dreaded Scroll Blindness.

JDK 1.4 provides an assertion feature (read Assertion), which enables you to test (or assert) your assumptions about your program logic (such as pre-conditions, post-conditions, and invariants). Nonetheless, assertion is primitive compared with the unit testing framework.

With a proper Unit Testing framework, you can automate the entire unit testing process. Your job becomes designing proper test cases to excite the program. Furthermore, the unit testing process can be integrated into the build process. In this case, the build process not only checks for syntax errors, but semantic errors as well.

1.1  Extreme Programming
Extreme programming (@ www.xprogramming.com) advocates "write test first, before writing codes".

1.2  xUnit Unit Testing Framework
xUnit is the family name given to a group of unit testing frameworks that share the same architecture, such as JUnit (for Java), NUnit (for .NET), CppUnit (for C++), PHPUnit (for PHP) and many others.

The xUnit architecture has these common components:

Test case / Test suites:
Test fixture:
Test runner:
Test result formatter:
Assertions:
2.  JUnit
JUnit (@ http://junit.org/) is an open-source Java Unit Testing Framework designed by Kent Beck, Erich Gamma. It is the de facto standard for Java Unit Testing. JUnit is not included in JDK, but included in most of the IDEs such as Eclipse and NetBeans.

2.1  Installing and Using JUnit
Installing JUnit: Goto http://junit.org/ ⇒ "Download and Install Guide" ⇒ Download the "junit.jar" and "hamcrest-core.jar". You could download the API documentation as well as the source code.

Using JUnit: To use the JUnit, include JUnit jar-files "junit-4.##.jar" and "hamcrest-core-1.##.jar" in your CLASSPATH.

2.2  Using JUnit under Eclipse
Include JUnit Library in your Java Project: Create a new Java project ⇒ right-click on the project ⇒ Properties ⇒ Java Build Path ⇒ "Libraries" tab ⇒ Add Library ⇒ JUnit ⇒ In "JUnit library version", choose "JUnit 4" ⇒ In "current location" use the eclipse's JUnit or your own download. [Alternatively, when you create a new test case or test suite (as describe below), Eclipse will prompt you to include the JUnit library.]

Create Test case (or Test Suite): To create a new JUnit test case (or test suite, which contains many test cases) ⇒ File ⇒ Others ⇒ Java ⇒ JUnit ⇒ JUnit test case (or JUnit test suite).

Run Test case (or Test Suite): To run a test case (or test suite), right-click the file ⇒ Run As ⇒ JUnit Test.

3.  JUnit 4
There are two versions of JUnit, version 3 and version 4, which are radically different. JUnit 4 uses the annotation feature (since JDK 1.5) to streamline the process and drop the strict naming conventions of test methods.

3.1  Getting Started with an Example
Suppose that we wish to carry out unit testing on the following Java program, which uses static methods to perform arithmetic operations on two integers. Take note that divide throws an IllegalArgumentException for divisor of zero.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
/**
 * The Calculator class provides static methods for
 *  arithmetic operations on two integers.
 */
public class Calculator {
   public static int add(int number1, int number2) {
      return number1 + number2;
   }
 
   public static int sub(int number1, int number2) {
      return number1 - number2;
   }
 
   public static int mul(int number1, int number2) {
      return number1 * number2;
   }
 
   // Integer divide. Return a truncated int.
   public static int divInt(int number1, int number2) {
      if (number2 == 0) {
         throw new IllegalArgumentException("Cannot divide by 0!");
      }
      return number1 / number2;
   }
 
   // Real number divide. Return a double.
   public static double divReal(int number1, int number2) {
      if (number2 == 0) {
         throw new IllegalArgumentException("Cannot divide by 0!");
      }
      return (double) number1 / number2;
   }
}
First Test Case
Let's do it under Eclipse.

Create a new Eclipse Java project called "JUnitTest".
Create a new class called "Calculator" under "src" folder, with the above program code.
Create a new folder called "test" for storing test scripts ⇒ Right-click on the project ⇒ New ⇒ Folder ⇒ In folder name, enter "test". Make "test" a source folder by right-click on "test" ⇒ Build Path ⇒ Use as source folder.
Create the first test case called "AddSubTest" ⇒ Right-click on folder "test" ⇒ New ⇒ Other ⇒ Java ⇒ JUnit ⇒ JUnit Test Case ⇒ New JUnit 4 test ⇒ In Name, enter "AddSubTest". Enter the following codes:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
import static org.junit.Assert.*;
import org.junit.Test;
 
public class AddSubTest {
   @Test
   public void testAddPass() {
      // assertEquals(String message, long expected, long actual)
      assertEquals("error in add()",  3, Calculator.add(1, 2));
      assertEquals("error in add()", -3, Calculator.add(-1, -2));
      assertEquals("error in add()",  9, Calculator.add(9, 0));
   }
 
   @Test
   public void testAddFail() {
      // assertNotEquals(String message, long expected, long actual)
      assertNotEquals("error in add()", 0, Calculator.add(1, 2));
   }
 
   @Test
   public void testSubPass() {
      assertEquals("error in sub()",  1, Calculator.sub(2, 1));
      assertEquals("error in sub()", -1, Calculator.sub(-2, -1));
      assertEquals("error in sub()",  0, Calculator.sub(2, 2));
   }
 
   @Test
   public void testSubFail() {
      assertNotEquals("error in sub()", 0, Calculator.sub(2, 1));
   }
}
To run the test case, right-click on the file ⇒ Run as ⇒ JUnit Test. The test result is shown in the JUnit panel. 4 tests were run and all succeeded. Study the test results.
Try modify one of the test to force a test failure and observe the test result, e.g.,
@Test
public void testAddPass() {
   assertEquals("error in add()",  0, Calculator.add(1, 2));
   .....
}
Explanation
A test case contains a number of tests, marked with annotation of "@org.junit.Test". Each of the test is run independently from the other tests.
Inside the test method, we can use static methods assertXxx() (in class org.unit.Assert) to assert the expected and actual test outcomes, such as:
public static void assertEquals([String message,] long expected, long actual)  
      // int and long: expected == actual
public static void assertEquals([String message,] double expected, double actual, double epsilon)
      // double: expect == actual within tolerance of epsilon
public static void assertEquals([String message,] Object expected, Object actual)
      // Object: expected.equals(actual)
public static void assertNotEquals(.....)

public static void assertSame([String message,] Object expected, Object actual)
      // Same Object: expected == actual
public static void assertNotSame(.....)

public static void assertTrue([String message,] boolean condition)
      // boolean: condition == true
public static void assertFalse([String message,] boolean condition)
      // boolean: condition == false

public static void assertNull([String message,] Object object)
      // object == null
public static void assertNotNull(......)

public static void assertArrayEquals([String message,], int[] expecteds, int[] actuals)
public static void assertArrayEquals([String message,], byte[] expecteds, byte[] actuals)
public static void assertArrayEquals([String message,], char[] expecteds, char[] actuals)
public static void assertArrayEquals([String message,], long[] expecteds, long[] actuals)
public static void assertArrayEquals([String message,], byte[] expecteds, byte[] actuals)
public static void assertArrayEquals([String message,], short[] expecteds, short[] actuals)
public static void assertArrayEquals([String message,], Object[] expecteds, Object[] actuals)

public static <T> void assertThat([String message,], T actual, org.hamcrest.Matcher<T> matcher)
Run Test Standalone via Test Runner
To run your test standalone (outside Eclipse), you could write a Test Runner as follows:

1
2
3
4
5
6
7
8
9
10
11
12
13
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
 
public class RunTestStandalone {
   public static void main(String[] args) {
      Result result = JUnitCore.runClasses(AddSubTest.class);
      for (Failure failure : result.getFailures()) {
         System.out.println(failure.toString());
      }
      System.out.println(result.wasSuccessful());
   }
}
You can include more than one test cases using runClasses(test1.class, test2.class, ...).

Run Test in Command-line
JUnit also provides a console version of test-runner called org.junit.runner.JUnitCore for you to run the tests in command-line, with the following syntax:

// Need to include JUnit's jar-file in CLASSPATH.
$ java org.junit.runner.JUnitCore TestClass1 [TestClass2 ...]
Copy all your classes into one folder (for simplicity).
Set the CLASSPATH to include the JUnit jar-files:
// Unix/Linux/Ubuntu/Mac (for this bash session only)
$ export CLASSPATH=.:$CLASSPATH:/path/to/junit/junit-4.11.jar:/path/to/junit/hamcrest-core-1.3.jar

// Windows (for this CMD session only)
> set CLASSPATH=.;%CLASSPATH%;x:\path\to\junit\junit-4.11.jar;x:\path\to\junit\hamcrest-core-1.3.jar
Compile all the source files:
$ cd /path/to/source-files
$ javac Calculator.java AddSubTest.java
Run the test:
$ java org.junit.runner.JUnitCore AddSubTest
JUnit version 4.11
....
Time: 0.006
OK (4 tests)
Second Test Case
Let's write another test case to test the divide methods, which throw an Exception for divisor of zero. Furthermore, the method divReal() returns a double which cannot be compared with absolute precision.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
import static org.junit.Assert.*;
import org.junit.Test;
 
public class DivTest {
   @Test
   public void testDivIntPass() {
      assertEquals("error in divInt()", 3, Calculator.divInt(9, 3));
      assertEquals("error in divInt()", 0, Calculator.divInt(1, 9));
   }
 
   @Test
   public void testDivIntFail() {
      assertNotEquals("error in divInt()", 1, Calculator.divInt(9, 3));
   }
 
   @Test(expected = IllegalArgumentException.class)
   public void testDivIntByZero() {
      Calculator.divInt(9, 0); // expect an IllegalArgumentException
   }
 
   @Test
   public void testDivRealPass() {
      assertEquals("error in divInt()", 0.333333, Calculator.divReal(1, 3), 1e-6);
      assertEquals("error in divInt()", 0.111111, Calculator.divReal(1, 9), 1e-6);
   }
 
   @Test(expected = IllegalArgumentException.class)
   public void testDivRealByZero() {
      Calculator.divReal(9, 0); // expect an IllegalArgumentException
   }
}
Run the test and observe the test result. Change testDivRealPass()'s expected value from 0.333333 to 0.333330 and check the test result.

Explanation
To test for exception, use annotation @Test with attribute expected = ExceptionClassName.
To compare doubles, use a tolerance (epsilon) as shown.
First Test Suite
A test suite comprises many test cases.

To create a test suite under Eclipse ⇒ right-click on the test folder ⇒ New ⇒ other ⇒ Java ⇒ JUnit ⇒ JUnit Test Suite ⇒ In Name, enter "AllTests" ⇒ Select test cases to be included - AddSubTest and DivTest.

The following test script will be created:

1
2
3
4
5
6
7
8
9
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
 
@RunWith(Suite.class)
@SuiteClasses({ AddSubTest.class, DivTest.class })
public class AllTests {
 
}
Take note that the test suite class is marked by annotation @RunWith and @SuiteClasses with an empty class body.

To run the test suite ⇒ right-click on the file ⇒ Run as ⇒ JUnit Test. Observe the test results produced.

You can also run the test suite via Test Runner org.junit.runner.JUnitCore, just like running test cases (as described earlier).

3.2  Testing Java Classes By Example
Instead of testing static methods in a Java class, let's carry out unit test on a proper self-contained and encapsulated Java class with its own private variables and public operations.

Suppose that we have a class called MyNumber that represents a number, and capable of performing arithmetic operations.

Again, we shall work under Eclipse.

Create a Java project called "JUnitTest2"
Create a new Java class called "MyNumber", as follow:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
/**
 * The class MyNumber represent a number, and capable
 * of performing arithmetic operations.
 */
public class MyNumber {
   int number;
 
   // Constructor
   public MyNumber() {
      this.number = 0;
   }

   public MyNumber(int number) {
      this.number = number;
   }
 
   // Getter and setter
   public int getNumber() {
      return number;
   }
 
   public void setNumber(int number) {
      this.number = number;
   }
 
   // Public methods
   public MyNumber add(MyNumber rhs) {
      this.number += rhs.number;
      return this;
   }
 
   public MyNumber div(MyNumber rhs) {
      if (rhs.number == 0) throw new IllegalArgumentException("Cannot divide by 0!");
      this.number /= rhs.number;
      return this;
   }
}
Create a new source folder called "test" for storing test scripts. Make it a source folder by right-click ⇒ Build Path ⇒ Use as source folder.
Create the first test case called MyNumberTest (under "test" folder), as follows:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
 
public class MyNumberTest {
   private MyNumber number1, number2; // Test fixtures
 
   @Before
   public void setUp() throws Exception {
      System.out.println("Run @Before"); // for illustration
      number1 = new MyNumber(11);
      number2 = new MyNumber(22);
   }
 
   @After
   public void tearDown() throws Exception {
      System.out.println("Run @After"); // for illustration
   }
 
   @Test
   public void testGetterSetter() {
      System.out.println("Run @Test testGetterSetter"); // for illustration
      int value = 33;
      number1.setNumber(value);
      assertEquals("error in getter/setter", value, number1.getNumber());
   }
 
   @Test
   public void testAdd() {
      System.out.println("Run @Test testAdd"); // for illustration
      assertEquals("error in add()", 33, number1.add(number2).getNumber());
      assertEquals("error in add()", 55, number1.add(number2).getNumber());
   }
 
   @Test
   public void testDiv() {
      System.out.println("Run @Test testDiv"); // for illustration
      assertEquals("error in div()", 2, number2.div(number1).getNumber());
      assertEquals("error in div()", 0, number2.div(number1).getNumber());
   }
 
   @Test(expected = IllegalArgumentException.class)
   public void testDivByZero() {
      System.out.println("Run @Test testDivByZero"); // for illustration
      number2.setNumber(0);
      number1.div(number2);
   }
}
Run the test and observe the result. Modify some lines to make the test fails and observe the result.
The output, used for illustrating the sequence of operations, is as follows:

Run @Before
Run @Test testDivByZero
Run @After
Run @Before
Run @Test testAdd
Run @After
Run @Before
Run @Test testDiv
Run @After
Run @Before
Run @Test testGetterSetter
Run @After
Test Fixtures, @Before and @After
A test fixtures is a fixed state of a set of objects used as a baseline for running tests. The purpose of a test fixture is to ensure that there is a well known and fixed environment in which tests are run so that results are repeatable.

In JUnit 4, fixtures are setup via the @Before and @After annotations.

The @Before annotated method (known as setup()) will be run before EACH test method (annotated with @Test) to set up the fixtures.
The @After annotation method (known as tearDown()) will be run after EACH test.
We typically declare text fixtures as private instance variables; initialize via @Before annotated method; and clean-up via @After annotation method. Each test method runs on its own set of text fixtures with the same initial states. This ensures isolation between the test methods.

@BeforeClass and @AfterClass
Beside the @Before and @After, there is also @BeforeClass and @AfterClass.

The @BeforeClass annotated method will be run once before any test, which can be used to perform one-time initialization tasks such as setting up database connection.
The @AfterClass annotated method will be run once after all tests, which can be used to perform housekeeping tasks such as closing database connection.
3.3  JUnit 4's Annotations
JUnit 4 defines the following six annotations in package org.junit.

Annotation	Description
@Test	The annotated method is to be run as a test method.
@Before	The annotated method is to be run before EACH of the test method.
@After	The annotated method is to be run after EACH of the test method.
@BeforeClass	The annotated method is to be run ONCE before any of the test method.
@AfterClass	The annotated method is to be run ONCE after all the test methods.
@Ignore	Ignore (don't run) the test method. This is a convenient way to mark out a test method (e.g. after some code changes that fail this test.)
@Rule	[TODO]
Example of @Ignore
@Ignore("Under Construction")
@Test
public void someTest() {
   ......
}
3.4  JUnit - Exceptions Test
To test if the code throws a desired exception, use annotation @Test(expected = exception.class), as illustrated in the previous example.

3.5  JUnit - Timing Test
To handle or test timeout, use annotation @Test(timeout = msec). For example,

1
2
3
4
5
6
7
8
import org.junit.Test;
 
public class TimeoutTest {
   @Test(timeout=1000)  // milliseconds
   public void test() {
      while (true) {}
   }
}
java.lang.Exception: test timed out after 1000 milliseconds
......
3.6  JUnit - Parameterized Test
JUnit 4 introduces parameterized test which allows you to run the same test over and over again using different values. To use parameterized test:

Annotate the test class with @RunWith(Parameterized.class).
Create a public static method annotated with @Parameters that returns a list (Iterable<Object>) as test data set.
Create a public constructor that takes its input from the @Parameters method to setup the test fixtures defined as instance variables. The constructor will be run before EACH test.
Create your tests case(s) using the instance variables as the source of the test data.
For example,

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;
 
import java.util.Arrays;
 
@RunWith(Parameterized.class)
public class MyNumberParameterizedTest {
   private MyNumber number1, number2;  // Test fixtures
   private int result;
 
   @Parameters
   // Feed inputs to constructor
   public static Iterable<Object[]> data()  {
      System.out.println("Run @Parameters");
      return Arrays.asList(new Object[][] {
         { new MyNumber(1), new MyNumber(2), 3 },
         { new MyNumber(-1), new MyNumber(-2), -3 },
         { new MyNumber(3), new MyNumber(-3), 0 },
      });
   }
 
   // Constructor
   // For each test, this constructor gets its inputs from
   // the @Parameters method to setup the test fixtures.
   public MyNumberParameterizedTest(MyNumber number1, MyNumber number2, int result) {
      System.out.println("Run constructor");
      this.number1 = number1;
      this.number2 = number2;
      this.result = result;
      System.out.println("-- number1=" + number1.getNumber()
                       + " number2=" + number2.getNumber()
                       + " result=" + result);
   }
 
   @Before
   // Run after constructor, before @Test
   public void setUp() throws Exception {
      System.out.println("Run @Before");
      System.out.println("-- number1=" + number1.getNumber() + " number2=" + number2.getNumber());
   }
 
   @Test
   public void test() {
      System.out.println("Run @Test");
      assertEquals(result, number1.add(number2).getNumber());
   }
 
   @After
   public void tearDown() throws Exception { }
}
Run @Parameters
Run constructor
-- number1=1 number2=2 result=3
Run @Before
-- number1=1 number2=2
Run @Test
Run constructor
-- number1=-1 number2=-2 result=-3
Run @Before
-- number1=-1 number2=-2
Run @Test
Run constructor
-- number1=3 number2=-3 result=0
Run @Before
-- number1=3 number2=-3
Run @Test
The output trace suggests that @Parameters method is run once. For EACH test, the constructor is run first, followed by @Before, @Test and @After methods.

3.7  Another Example
import org.junit.*;
import java.util.ArrayList;
import org.junit.runner.Result;
   
public class ArrayListTest {
   private ArrayList<String> lst;   // Test fixtures
   
   // Initialize test fixtures before each test method
   @Before  
   public void init() throws Exception {
      lst = new ArrayList<String>();
      lst.add("alpha");    // at index 0
      lst.add("beta");     // at index 1
   }
   
   // Test method to test the insert operation
   @Test   
   public void insertTest() {
      // assertEquals(String message, long expected, long actual)
      Assert.assertEquals("wrong size", 2, lst.size());
      lst.add(1, "charlie");
      Assert.assertEquals("wrong size", 3, lst.size());
      // assertEquals(String message, Object expected, Object actual)
      // Use String.equals() for comparison
      Assert.assertEquals("wrong element", "alpha",   lst.get(0));
      Assert.assertEquals("wrong element", "charlie", lst.get(1));
      Assert.assertEquals("wrong element", "beta",    lst.get(2));
   }
   
   // Test method to test the replace operation
   @Test   
   public void replaceTest() {
      Assert.assertEquals("wrong size", 2, lst.size());
      lst.set(1, "charlie");
      Assert.assertEquals("wrong size", 2, lst.size());
      Assert.assertEquals("wrong element", "alpha",   lst.get(0));
      Assert.assertEquals("wrong element", "charlie", lst.get(1));
   }
   
   public static void main(String[] args) {
      Result r = org.junit.runner.JUnitCore.runClasses(ArrayListTest.class);
      System.out.println(r.wasSuccessful());
   }
}
To run the test, you can either include a main() method as above, or use the command-line.

3.8  JUnit Package org.junit
The core package for JUnit 4 is org.unit, which is simple and elegantly designed.

Assert class: contains static methods assertEquals(), assertTrue(), assertFalse(), assertNull(), assertNotNull(), assertSame(), assertNotSame(), assertThat(), assertArrayEquals().
Assume class: contains static methods assumeTrue(), assumeNotNull(), assumeThat(), assumeNoException().
@Test: mark the method as a test method.
@Test(expected=IOException.class): The test is expected to trigger this exception.
@Test(timeout=1000): Treat the test as fail, if it exceeds the specified milliseconds.
@Before and @After: mark the method as to be run before and after EACH test method, for initializing and cleaning-up test fixtures.
@BeforeClass and @AfterClass: mark the method as to be run before and after ONCE for the class.
@Ignore: ignore this test method (annotated with @Test).
@Rule: [TODO]
4.  JUnit 3.8 (deprecated?)
JUnit 3.8, which uses strict naming convention to denote various entities, is probably deprecated. I suggest that you move to JUnit 4, which is more intuitive by using annotation.

4.1  Let's begin with an Example
Below is a Java program to be tested. Note that there is a logical error in the program.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
public class Grade {
   public static char getLetterGrade(int mark) {
      // assume that mark is between 0 and 100 (inclusive)
      assert (mark >= 0 && mark <= 100) : "mark is out-of-range: " + mark;
      if (mark >= 75) {
         return 'A';
      } else if (mark >= 60) {
         return 'B';
      } else if (mark > 50) {   // an logical error here
         return 'C';
      } else {
         return 'F';
      }
   }
}
The unit-test program (using JUnit framework) is as follows. Black-box test cases are set up to test typical values as well as boundary values.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
   
public class GradeUnitTest extends TestCase {
   
   public GradeUnitTest(String name) { super(name); }
   protected void setUp() throws Exception { super.setUp(); }
   protected void tearDown() throws Exception { super.tearDown(); }
   
   public void testTypical() {      // test a typical value in partitions
      assertEquals("wrong grade", 'A', Grade.getLetterGrade(95));
      assertEquals("wrong grade", 'B', Grade.getLetterGrade(72));
      assertEquals("wrong grade", 'C', Grade.getLetterGrade(55));
      assertEquals("wrong grade", 'F', Grade.getLetterGrade(30));
   }
   
   public void testBoundaries() {   // test the boundaries of the partitions
      assertEquals("wrong grade", 'A', Grade.getLetterGrade(75));
      assertEquals("wrong grade", 'A', Grade.getLetterGrade(100));
      assertEquals("wrong grade", 'B', Grade.getLetterGrade(60));
      assertEquals("wrong grade", 'B', Grade.getLetterGrade(74));
      assertEquals("wrong grade", 'C', Grade.getLetterGrade(50));
      assertEquals("wrong grade", 'C', Grade.getLetterGrade(59));
      assertEquals("wrong grade", 'F', Grade.getLetterGrade(0));
      assertEquals("wrong grade", 'F', Grade.getLetterGrade(49));
   }
   
   public static Test suite() {   // For putting into a TestSuite.
      return new TestSuite(GradeUnitTest.class);
   }
   
   public static void main(String[] args) {
      junit.textui.TestRunner.run(GradeUnitTest.class);
   }
}
Compile and execute the program (with JUnit JAR file included in the CLASSPATH) as follows. Note that one of the unit-test cases catches the logical error.

> set CLASSPATH=.;%CLASSPATH%;c:\junit\junit-3.8.2.jar
> javac GradeUnitTest.java
> java GradeUnitTest
..F
Time: 0.006
There was 1 failure:
1) testBoundaries(GradeUnitTest)junit.framework.AssertionFailedError: wrong grade expected:<C> but was:<F>
        at GradeUnitTest.testBoundaries(GradeUnitTest.java:23)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
        at GradeUnitTest.main(GradeUnitTest.java:34)
FAILURES!!!
Tests run: 2,  Failures: 1,  Errors: 0
4.2  JUnit Terminology
Class TestCase: A class that contains test methods should derive from this superclass. Each TestCase can include many test methods.
Test Methods: A test methods must be named testXxx(). This is because JUnit uses the reflection mechanism to find and run these methods. Inside a test method, you can use a variation of the assert() method (e.g., assertTrue(), assertFalse(), assertEquals()) to compare the expected and actual results.
Test Fixture: The set of objects that a test method operates on. You declare these objects as a private variable, and initialize them by overriding the setUp() or via the constructor. You can perform clean-up operations by overriding tearDown(). Each test method runs on its own TestCase instance with its own set of text fixtures. This ensures isolation between the test methods.
Class TestSuite: You can combine many TestCases (e.g., written by different person) into a test suite, and run them at once.
Class TestRunner: for running the TestCase or TestSuite.
4.3  Writing Tests
Step 1: Extend a subclass of junit.framework.TestCase:

import junit.framework.*;
public class JUnit38DemoArrayList extends TestCase {
   public JUnit38DemoArrayList(String name) { super(name); }   // constructor
} 
Step 2: If two or more test methods use a common set of test objects (called test fixtures), declare the test fixtures as instance variables. For example, suppose we are testing the class ArrayList.

private ArrayList<String> lst;     // declare test fixture instance.
Step 3: Initialize the text fixture. You can override setUp() or use the constructor. Each test method runs on its own TestCase instance. This provides isolation between test methods. Each test method invoke the constructor to construct an instance of the TestCase, followed by setUp(), run the steps coded inside the test method, and the tearDown() before exiting. The test methods may run concurrently. For example, let's initialize our test fixture ArrayList with two String elements.

// Initialize the test fixture used by all the test methods
protected void setUp() throws Exception {
   lst = new ArrayList<String>();
   lst.add("alpha");    // at index 0
   lst.add("beta");     // at index 1
}
protected void tearDown() throws Exception { super.tearDown(); }  // for clean-up operation
Step 4: Write the test methods for this TestCase. All the test methods must be named testXxx(), as JUnit uses reflection to find these test methods. For example,

// test method to test the insert operation
public void testInsert() {
   assertEquals("wrong size", 2, lst.size());  // error message, expected, actual
   lst.add(1, "charlie");
   assertEquals("wrong size", 3, lst.size());
   assertEquals("wrong element", "alpha",   lst.get(0));
   assertEquals("wrong element", "charlie", lst.get(1));
   assertEquals("wrong element", "beta",    lst.get(2));
}
// test method to test the replace operation
public void testReplace() {
   assertEquals("wrong size", 2, lst.size());
   lst.set(1, "charlie");
   assertEquals("wrong size", 2, lst.size());
   assertEquals("wrong element", "alpha",   lst.get(0));
   assertEquals("wrong element", "charlie", lst.get(1));
}
Step 5: You can now run the TestCase, using JUnit-provided TestRunner. There are two versions of TestRunner: text-based junit.textui.TestRunner, and GUI-based junit.swingui.TestRunner. To use the text-based TestRunner, you could include a main() method as follows:

public static void main(String[] args) {
   junit.textui.TestRunner.run(JUnit38DemoArrayList.class);
}
The expected outputs are:

..
Time: 0.001

OK (2 tests)
You can also invoke the TestRunner from command-line:

> java junit.textui.TestRunner JUnit38DemoArrayList
You can invoke the GUI-based TestRunner from command-line:

> java junit.swingui.TestRunner JUnit38DemoArrayList
Step 6: If there are many TestCases (could be written by different people), you can put them together into a TestSuite and run all the TestCases at once. To do so, in each of the TestCases, create a static method suite() to extract all the test methods as follows:

// In JUnit38DemoArrayList Class - do the same for other TestCase classes
public static Test suite() {
   return new TestSuite(JUnit38DemoArrayList.class);
}
Next, write a class to include all the TestCases into a TestSuite.

import java.framework.*; 
public class AllTests {   
   public static void main(String[] args) {
      junit.textui.TestRunner.run(suite());    
   }
   public static Test suite() {
      TestSuite suite = new TestSuite();
      suite.addTest(JUnit38DemoArrayList.suite());
      // other TestCase classes
      //suite.addTest(OtherTestCase1.suite());       
      //suite.addTest(OtherTestCase2.suite());
      return suite;
   }
}
5.  Automating Unit Testing with ANT or Maven
[TODO] To tidy up.

Apache's ANT is the de facto standard for automated building of Java applications (similar to Unix's "make" utility). You can download ANT from ant.apache.org (download the ZIP version, and unzip it to a directory of your choice).

We shall use ANT to automate building and testing. First, create a configuration file called "build.xml" as follows:

<?xml version="1.0"?>
<!-- to save as "build.xml" -->
   
<project name="Black-Box Unit Test Demo" default="run" basedir=".">
  <!-- build all classes in this directory -->
  <!-- To run this: use "ant build" -->
  <!-- need to include junit.jar in the classpath -->
  <target name="build">
  <javac srcdir="${basedir}"/>
  <echo message="Build done" />
  </target>
   
  <!-- Test and build all files  -->
  <!-- To run this: use "ant" (default) or "ant run" -->
  <target name="run" depends="build">
  <java taskname="Test" classname="GradeTestCase" fork="true" failonerror="true" />
  <echo message="Unit Test done" />
  </target>
   
  <!-- delete all class files -->
  <!-- To run this: use "ant clean" -->
  <target name="clean">
  <delete>
  <fileset dir="${basedir}" includes="*.class" />
  </delete>
  <echo message="clean done" />
  </target>
</project>
To build using the above build file, run "ant". (By default, it executes "ant run", which is depends on "build", "build" get executed to compile the program, then "run" get expected to run the testing. To run only the compilation, use "ant build". To run only the cleanup, use "ant clean".)

prompt> ant
Buildfile: build.xml
  
build:
    [javac] Compiling 4 source files
     [echo] Build done
  
run:
     [Test] ..F
     [Test] Time: 0.005
     [Test] There was 1 failure:
     [Test] 1) testBoundaries(GradeTestCase)junit.framework.AssertionFailedError: expected:<C> but was:<F>
     [Test]     at GradeTestCase.testBoundaries(GradeTestCase.java:23)
     [Test]     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
     [Test]     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
     [Test]     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
     [Test]     at GradeTestCase.main(GradeTestCase.java:34)
     [Test]
     [Test] FAILURES!!!
     [Test] Tests run: 2,  Failures: 1,  Errors: 0
     [Test]
     [echo] Unit Test done
[TODO] to be continued...

6.  Unit Testing Best Practices
6.1  Writing Test Cases
How to test a program to ensure correctly? There are two techniques: white-box testing and black-box testing. White-box testing inspect the program codes and test the program logic. Black-box testing does not inspect the program codes, but looking at the input-output, treating the program as a black box.

For black-box testing, the most common approach is to partition the inputs, and design test cases for each input partition. The test cases could test on a typical input value as well as the boundaries.

For example, the following program converts a given mark (0-100) to a letter grade ('A' to 'F'). There is a logical error in the program.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
import static org.junit.Assert.assertEquals;
import org.junit.Test;
 
public class GradeLetters {
 
   // Convert given mark into letter grade
   // Assume that mark is between 0 and 100 (inclusive)
   public static char getLetterGrade(int mark) {
      // Assert is disabled by default,
      // To enable, run with option -enableassertions (or -ea)
      assert (mark >= 0 && mark <= 100) : "mark is out-of-range: " + mark;
 
      if (mark >= 75) {
         return 'A';
      } else if (mark >= 60) {
         return 'B';
      } else if (mark > 50) {   // an logical error here
         return 'C';
      } else {
         return 'F';
      }
   }
 
   // Test a typical value in each partition
   @Test
   public void testTypical() {
      assertEquals("wrong grade", 'A', GradeLetters.getLetterGrade(95));
      assertEquals("wrong grade", 'B', GradeLetters.getLetterGrade(72));
      assertEquals("wrong grade", 'C', GradeLetters.getLetterGrade(55));
      assertEquals("wrong grade", 'F', GradeLetters.getLetterGrade(30));
   }
 
   // Test the boundaries of the each partition
   @Test
   public void testBoundaries() {
      assertEquals("wrong grade", 'A', GradeLetters.getLetterGrade(75));
      assertEquals("wrong grade", 'A', GradeLetters.getLetterGrade(100));
      assertEquals("wrong grade", 'B', GradeLetters.getLetterGrade(60));
      assertEquals("wrong grade", 'B', GradeLetters.getLetterGrade(74));
      assertEquals("wrong grade", 'C', GradeLetters.getLetterGrade(50)); // fail
      assertEquals("wrong grade", 'C', GradeLetters.getLetterGrade(59));
      assertEquals("wrong grade", 'F', GradeLetters.getLetterGrade(0));
      assertEquals("wrong grade", 'F', GradeLetters.getLetterGrade(49));
   }
}
Try to run the above tests to find the logical error. Take note that assertEquals() does not accept char as arguments, but upcast to long. That is, the output show the char's numeric code.

6.2  Unit Testing Best Practices (From JUnit FAQ)
The followings are extracted from JUnit FAQ:

When should the tests be written?
Tests should be written before the code. Good tests tell you how to best design the system for its intended use. They also prevent tendencies to over-build the software. When all the tests pass, you know you're done. Whenever a customer reports a bug, first write the necessary unit test(s) to expose the bug(s) and fix them. This make it almost impossible for the same bug to resurface later.
Do I have to write a test for everything?
No, just test things that could reasonably break. Don't write tests that turn out to be testing the operating system or environment or the compiler. For example,
public class AClass {
   int x;
   public AClass(int x) { this.x = x; }
   int getX() { return x; }
   void setX() { this.x = x; }
}
A test that testing getX(setX(y)) == y is merely testing for this.y = y, i,e, testing the compiler! This can't break unless the compiler or the interpreter break!
How often should I run my tests?
Run unit test as often as possible, ideally every time the code is changed. Run all your acceptance, integration, stress, and unit tests at least once per day (for your nightly-built).
7.  TestNG
TestNG (Test Next Generation) (@ http://testng.org/) is a testing framework inspired from JUnit and NUnit (the xUnit family), but introduces new functionalities like dependency testing, grouping concept to make testing easier and more powerful.

TestNG is designed to cover all types of tests: unit, integration, functional, and etc.

7.1  Installing TestNG
Installing TestNG: From TestNG download site (@ http://testng.org/doc/download.html), download the "testng-6.#.zip". Unzip the downloaded file. The binaries is kept in "testng-6.#.jar"

To install TestNG Eclipse Plug-in ⇒ Launch Eclipse ⇒ Help ⇒ Install New Software ⇒ In Work with, enter http://beust.com/eclipse ⇒ Add ⇒ Select TestNG.

Using TestNG: To use TestNG, include the jar-files in the CLASSPATH.

In Eclipse, right-click on the project ⇒ Add Library ⇒ TestNG.

API Documentation: The TestNG API documentation is available @ http://testng.org/javadocs/.

7.2  Getting Started with TestNG with Example
I shall assume that you are familiar with JUnit 4.

Let's use TestNG (instead of JUnit) to test the MyNumber class written in the earlier section.

In Eclipse, right-click on the project ⇒ New ⇒ TestNG ⇒ TestNG class.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
import static org.testng.Assert.*;
import org.testng.annotations.*;
 
public class MyNumberTestNGTest {
   private MyNumber number1, number2; // Test Fixtures
 
   @BeforeClass
   public void oneTimeSetUp() {
      System.out.println("@BeforeClass - oneTimeSetUp");
   }
 
   @AfterClass
   public void oneTimeTearDown() {
      System.out.println("@AfterClass - oneTimeTearDown");
   }
 
   @BeforeMethod
   public void setUp() {
      number1 = new MyNumber();
      number2 = new MyNumber();
      System.out.println("@BeforeMethod - setUp before each test");
   }
 
   @AfterMethod
   public void tearDown() {
      System.out.println("@AfterMethod - tearDown before each test");
   }
 
   @Test
   public void testAdd() {
      System.out.println("@Test - testAdd");
      number1.setNumber(1);
      number2.setNumber(2);
      // assertEquals(actual, expected)
      assertEquals(number1.add(number2).getNumber(), 3);
   }
 
   @Test(expectedExceptions = IllegalArgumentException.class)
   public void testDiv() {
      System.out.println("@Test - testDiv with exception");
      number1.setNumber(1);
      number2.setNumber(0);
      number1.div(number2);
   }
}
To run the test case under Eclipse, right-click on the file ⇒ Run as ⇒ TestNG Test.

@BeforeClass - oneTimeSetUp
@BeforeMethod - setUp before each test
@Test - testAdd
@AfterMethod - tearDown before each test
@BeforeMethod - setUp before each test
@Test - testDiv with exception
@AfterMethod - tearDown before each test
@AfterClass - oneTimeTearDown
PASSED: testAdd
PASSED: testDiv

===============================================
    Default test
    Tests run: 2, Failures: 0, Skips: 0
===============================================
As seen from the output, the @BeforeClass annotated method is run ONCE for one-time setup; the @AfterClass is run ONCE for one-time tear down. The @BeforeMethod and @AfterMethod (called @Before and @After in JUnit 4) are run before and after EACH @Test.

So far, everything is similar to JUnit 4, except some name changes.

7.3  Running TestNG Test Cases
There are several ways to run test case for TestNG:

With an XML description file.
With ANT build tool.
Via TestNG XML Description File
TestNG (compared with JUnit) introduces an XML description to describe test suite/test cases to provide more flexibility in running tests.

Prepare the following XML Description file (says "testing.xml"), which describes a test suite comprising of test cases. Each test case comprises of many Java classes.

1
2
3
4
5
6
7
8
9
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
<suite name="MyNumberTestSuite">
  <test name="MyNumberTest">
    <classes>
       <class name="MyNumberTestNGTest"/>
    </classes>
  </test>
</suite>
You can run the test suite in command-line:

// Set CLASSPATH to include the TestNG jar-file
// For Linux/Mac with bash shell
$ export CLASSPATH=.:$CLASSPATH:/path/to/testng-6.8/testng-6.8.jar
 
// For Windows
> set CLASSPATH=.;%CLASSPATH%;x:\path\to\testng-6.8\testng-6.8.jar
 
// Compile the Java test classes
$ javac MyNumberTestNGTest.java
 
// Run the test thru XML description file
$ java org.testng.TestNG testing.xml
@BeforeClass - oneTimeSetUp
@BeforeMethod - setUp before each test
@Test - testAdd
@AfterMethod - tearDown before each test
@BeforeMethod - setUp before each test
@Test - testDiv with exception
@AfterMethod - tearDown before each test
@AfterClass - oneTimeTearDown
 
===============================================
MyNumberTestSuite
Total tests run: 2, Failures: 0, Skips: 0
===============================================
In Eclipse, to run a suite description file ⇒ Run ⇒ Run Configurations ⇒ Suite ⇒ Select the desired XML description file.

The XML description file has this syntax:

The root tag is <suite>.
The <suite> tag can contain one or more <test> tags.
The <test> tag can contain one or more <classes> tags.
The <classes> tag can contain one or more <method> tags.
Via ANT Script
[TODO]

7.4  TestNG's Annotations
Name	Description
@Test	Mark a method (or class) as a test method (or class).
@BeforeSuite / @AfterSuite	Run ONCE before and after all tests in this suite.
@BeforeClass / @AfterClass	Run ONCE before and after all tests in this class.
@BeforeMethod / @AfterMethod	Run before and after EACH @Test method.
@BeforeTest / @AfterTest	[TODO]
@BeforeGroups / @AfterGroups	[TODO]
@Parameters	Mark this test method is to get its parameters from the XML description file.
@DataProvider	Mark the method, which return an Object[][], as data source for a test method.
@Factory	[TODO]
@Listeners	[TODO]
7.5  TestNG - Exception Test
Mark the test method that is expected to throw an exception with @Test(expectedExceptions = ExceptionName.class) as seen in the above example.

JUnit 4 uses annotation @Test(expected = ExceptionName.class).

7.6  TestNG - Ignore Test
To ignore a test, mark it with annotation @Test(enabled=false).

JUnit 4 uses an dedicated annotation @Ignore to override the @Test annotation.

7.7  TestNG - Timing Test
To set a timeout (milliseconds) for a test, use annotation @Test(timeOut = msec) (exactly the same as JUnit 4).

7.8  TestNG - Parameterized Test
Via @Parameters and the XML Description File <parameter> Tag
The test class is as follows:

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
import static org.testng.Assert.*;
import org.testng.annotations.*;
 
public class TestNGParameterizedTest1 {
   // Test fixtures
   private MyNumber number1 = new MyNumber();
   private MyNumber number2 = new MyNumber();
 
   @Test
   @Parameters(value={"value1", "value2", "result"})
   public void testAdd(int value1, int value2, int result) {
      System.out.println("value1=" + value1 + " value2=" + value2 + " result=" + result);
      number1.setNumber(value1);
      number2.setNumber(value2);
      assertEquals(number1.add(number2).getNumber(), result);
   }
}
Mark the parameterized test method with annotation @Parameters(value=xxx), where xxx is a String[]. The values will be passed into the arguments of the method in the same order.

The parameters are fed from the XML description file with the <parameter> tag. For example,

1
2
3
4
5
6
7
8
9
10
11
12
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
<suite name="MyNumberTestSuite">
  <test name="MyNumberTest">
    <parameter name="value1" value="11" />
    <parameter name="value2" value="22" />
    <parameter name="result" value="33" />
    <classes>
       <class name="TestNGParameterizedTest1"/>
    </classes>
  </test>
</suite>
Via the @DataProvider
The @Parameters annotation can only used to pass simple type (such as String and int). To pass objects, you need to use @DataProvider annotation.

For example,

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
import static org.testng.Assert.*;
import org.testng.annotations.*;
 
public class TestNGParameterizedTest2 {
   @Test(dataProvider = "testAddDataProvider")
   public void testAdd(MyNumber number1, MyNumber number2, int result) {
      System.out.println("number1=" + number1.getNumber()
                       + " number2=" + number2.getNumber()
                       + " result=" + result);
      assertEquals(number1.add(number2).getNumber(), result);
   }
 
   // Data Provider to feed the parameter data row-by-row to test
   @DataProvider(name = "testAddDataProvider")
   public Object[][] parameterIntTestProvider() {
      return new Object[][]{
         {new MyNumber(11), new MyNumber(22), 33},
         {new MyNumber(111), new MyNumber(222), 333},
         {new MyNumber(1111), new MyNumber(2222), 3333}
      };
   }
}
number1=11 number2=22 result=33
number1=111 number2=222 result=333
number1=1111 number2=2222 result=3333
PASSED: testAdd(MyNumber@1e53fc13, MyNumber@1bca52f3, 33)
PASSED: testAdd(MyNumber@74b1896c, MyNumber@33b54d4e, 333)
PASSED: testAdd(MyNumber@15e19d13, MyNumber@f0f559e, 3333)

===============================================
    Default test
    Tests run: 3, Failures: 0, Skips: 0
===============================================
7.9  TestNG - Method Dependency Test
TestNG (compared with JUnit) introduces test dependency. For example,

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
import static org.testng.Assert.*;
import org.testng.annotations.*;
 
public class TestNGDependsTest {
   @Test
   public void method1() {
      System.out.println("@Test: method1");
      assertTrue(true);  // change to false
   }
 
   @Test(dependsOnMethods={"method1"})
   public void method2() {
      System.out.println("@Test: method2");
      assertTrue(true);
   }
 
   @Test(dependsOnMethods={"method1","method2"})
   public void method3() {
      System.out.println("@Test: method3");
   }
}
 
@Test: method1
@Test: method2
@Test: method3
PASSED: method1
PASSED: method2
PASSED: method3

===============================================
    Default test
    Tests run: 3, Failures: 0, Skips: 0
===============================================
In method1, if we change to assertTrue(false) to fail the test, method2 and method3 will not be run, but marked as skip (instead of fail as in JUnit 4), as shown in the following outputs:

@Test: method1
FAILED: method1
java.lang.AssertionError: expected [true] but found [false]
SKIPPED: method2
SKIPPED: method3

===============================================
    Default test
    Tests run: 3, Failures: 1, Skips: 2
===============================================
7.10  TestNG - Group Test and Dependency
Each test method can be assigned to one or more groups. We can select one or more groups to test via XML description file. For example,

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
import org.testng.annotations.*;
 
public class TestNGGroupTest {
   @Test(groups = {"init"})
   public void method1() {
      System.out.println("@Test: method1");
   }
 
   @Test(groups = {"init", "post-init"})
   public void method2() {
      System.out.println("@Test: method2");
   }
 
   @Test(groups = {"main"})
   public void method3() {
      System.out.println("@Test: method3");
   }
}
 
The XML description file to run methods in group "init" only.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
<suite name="MyNumberTestSuite">
  <test name="MyNumberTest">
    <groups>
     <run>
      <include name="init" />
     </run>
   </groups>
    <classes>
       <class name="TestNGGroupTest"/>
    </classes>
  </test>
</suite>
Dependency on Groups
Instead of specifying dependency on individual method names as in the previous section, we can place related method (e.g., init methods) in groups, and specifying dependency on groups of methods. For example,

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
import static org.testng.Assert.*;
import org.testng.annotations.*;
 
public class TestNGGroupDependsTest {
   @Test(groups = {"init"})
   public void method1() {
      System.out.println("@Test: method1");
      assertTrue(true);  // try true and false
   }
 
   @Test(groups = {"init", "post-init"})
   public void method2() {
      System.out.println("@Test: method2");
   }
 
   @Test(groups = {"main"}, dependsOnGroups={"init"})
   public void method3() {
      System.out.println("@Test: method3");
   }
}
If we use assertTrue(true) in method1, method3 will be run. However, if we use assertTrue(false) in method1, method3 will be skipped.

REFERENCES & RESOURCES

JUnit mother site @ http://junit.org.
TestNG mother site @ http://testng.org.
JUnit API documentation @ http://junit.sourceforge.net/javadoc_40.
Kent Beck and Erich Gamma, "JUnit Cookbook" @ http://junit.sourceforge.net/doc/cookbook/cookbook.htm.
JUnit A Cook's Tour (for JUnit 3.8) @ http://junit.sourceforge.net/doc/cookstour/cookstour.htm.
