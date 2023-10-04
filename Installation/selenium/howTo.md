Webapp Acceptance Test with Selenium
1.  Introduction
There are various type of software testings:

Unit Test: Test individual component/class in isolation.
Integration Test: Test a group of associated components/classes.
Acceptance Test (or Functional Test): operate on a fully integrated system, testing against the user interface (e.g., HTML for browser or XML/JSON for web services) for functions provided by the system.
Regression Test: Tests to ensure that a change (such as enhancement, patches or configuration change) does not break the system or introduce new faults.
The popular webapp Acceptance test frameworks include:

Selenium @ http://www.seleniumhq.org.
......
[TODO]

2.  Selenium for Webapp Acceptance Test
References
Selenium Documentation @ http://www.seleniumhq.org/docs/index.jsp.
Acceptance Testing of Web Applications with PHP @ http://devzone.zend.com/1014/acceptance-testing-of-web-applications-with-php/.
Selenium Tutorial @ http://www.guru99.com/selenium-tutorial.html.
Selenium is an open-source automated testing suite for webapp. It supports most of the browsers and platforms. You can generate test scripts via record/playback (using a Selenium tool called Selenium IDE), or write the test scripts in one of the languages such as Java, C#, Perl, Python, PHP and Ruby.

Selenium automates acceptance testing (or functional testing) for webapps by simulating a user's interaction with the webapp through remotely controlled Web browser. There are currently two versions: Selenium 1 (or Selenium RC (Remote Control)) and Selenium 2 (or Selenium WebDriver). Selenium 2 makes direct calls to browser via browser's native support; while Selenium 1 injects JavaScript functions, which has certain limitations.

The Selenium suite consists of the following tools/components:

Selenium IDE: an firefox plug-in for recording/playback tests.
Selenium 1 (or Selenium RC)
Selenium 2 (or Selenium WebDriver)
Selenium Grid: For running parallel tests.
There is an excellent and detail Selenium tutorial @ http://www.guru99.com/selenium-tutorial.html.

3.  Selenium IDE (Firefox plugin)
References

Selenium-IDE Documentation @ http://www.seleniumhq.org/docs/02_selenium_ide.jsp.
You can write your Selenium test scripts by hand using one of the programming languages such as Java, C#, PHP, Perl, Python or Ruby; but the easiest way is to use the "Selenium IDE Firefox plug-in" to record and generate test scripts. Selenium IDE is a prototyping tool for building test scripts. It has a recording feature, which could record user actions as they are performed. You could run the recorded tests or export them as a reusable test script in one of programming languages (Java, C#, Python, Perl, PHP, and Ruby) that can be enhanced and executed.

3.1  Installing Selenium IDE Firefox plugin
Start Firefox, goto http://www.seleniumhq.org/download/ and click "Selenium IDE" to install the plug-in. Restart firefox.

You may install additional plug-ins such as "PHP Formatter" on the same download page.

3.2  Getting Started with Selenium IDE by Examples
Example 1: Test Login Success and Failure
The following PHP script ("login.php") presents a login form. If login is successful, it re-directs to "main.php"; otherwise, it displays an error message on the same form. We need to test the login success/failure functions. There is also a "Forgot Password" link on the page, that needs to be tested.

Assume that the URL for this page is http://localhost/login.php. The valid username/password is test/pwcorrect (as hardcoded inside the script).

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
<?php
$errMsg = '';
 
/*
 * Processing login request via POST parameters:
 *   todo=login&username=xxx&password=xxx
 */
if (isset($_POST['todo']) and $_POST['todo'] === 'login'
      and isset($_POST['username']) and isset($_POST['password'])) {
 
   // Get the value of POST parameters.
   $username = $_POST['username'];
   $password = $_POST['password'];
 
   // For testing purpose, hardcode username and password.
   if ($username === 'test' and $password === 'pwcorrect') {
      // If login succeeds, re-direct to main.php page 
      header('Location: main.php');
      exit;
   } else {
      // If login fails, display an error message. 
      $errMsg = '<p id="loginError">Wrong username or password!</p>';
   }
}
?>
 
<h1>LOG IN</h1>
<form method="post" >
  <input type="hidden" name="todo" value="login" />
  <table>
    <tr>
      <td>Username:</td>
      <td><input type="text" name="username" id="username" /></td>
    </tr>
    <tr>
      <td>Password: </td>
      <td><input type="password" name="password" id="password" value=""/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type = "submit" value = "GO"/>&nbsp;&nbsp;&nbsp;
        <a href="ForgotPassword.php">Forgot Password</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td id="loginError"><?php echo $errMsg ?></td>
    </tr>
  </table>
</form>
Login-Success Test
To record a test for login-success function (using Selenium IDE Firefox plug-in Tool):

Start firefox.
Start the Selenium IDE plug-in, by clicking the "Selenium IDE" button added to Firefox. The Selenium Control Panel appears. In "Base URL", enter http://localhost/, which serves as the base URL for all the references in the script.
Start recording by clicking the "Record" button on the top-right corner (if recording is not started).
In the Firefox browser, enter web link http://localhost/login.php; enter "test" as "username", "pwcorrect" as "password"; and click the submit button.
Stop the recording.
Study the test commands recorded. Click the "Source" tab, which shows the recorded commands in an HTML test script.
To run the recorded commands, click the "run" button.
Next, add assert commands to verify the operation. Right-click on the command panel ⇒ Insert new command ⇒ Enter "assertLocation" in "Command" and "http://localhost/main.php" in "Target".
Rerun the test commands.
Save the test script as an HTML file (e.g., LoginSuccessTest.html).
You can also export the test in one of the programming languages. Select "File" menu ⇒ "Export Test Case as" ⇒ choose your programming language/test framework/Selenium such as Java/JUnit4/WebDriver or PHP (PHPUnit). Study the exported test script.
Login-Failure Test
Start recording a test.
Enter "testwrong" as username; "pwwrong" as password; and submit.
Insert New Command ⇒ In command, enter "assertTextPresent"; in value, enter "Wrong username or password!".
Run the test.
Save the test as an HTML file
Export to your choice of programming language.
More Examples
Read http://www.guru99.com/first-selenium-test-script.html.

3.3  Commonly-used Commands
open:
click/clickAndWait:
waitForPageToLoad:
waitForElementToLoad:
[TODO]
3.4  Commonly-used Assert and Verification Commands
"Assert" fails the test and abort the current test case; while "verify" fails the test, but continue to run the test case.

verifyTitle/assertTitle: verifies the expected page title value in <title>.
verifyTextPresent:
verifyElementPresent:
verifyText:
[TODO]
3.5  Locating Elements
A locator is used to locate an element in the HTML document. Selenium IDE supports these locators:

identifier=xxx (or simply xxx): Return the first element with an matching "id" value. If there is no matching "id" value, return the first element with an matching "name" value
id=xxx: Return the first element with an matching "id" value.
name=xxx (or name=xxx value=yyy): Return the first element with an matching "name" value; or matching "name" as well as "value".
xpath=xxx:
link=xxx:
dom=xxx:
css=xxx:
[TODO]
4.  Selenium 1 (Selenium RC)
The Selenium 1 (or Selenium Remote Control (RC)) comprises:

The Selenium RC, which launches the browser with itself as the proxy server. It injects javascript to play the test, intercept and verify HTTP messages passed between the browser and the test program.
Client libraries which provide the interface between each programming language (Java, Ruby, Python, Perl, PHP and C#) and the Selenium RC Server.
In this section, I shall illustrate Selenium RC with PHP as the programming language and PHPUnit as the testing framework. Read "PHPUnit How-To" if you are not familiar with PHPUnit.

4.1  Installing Selenium 1 (with PHP for Ubuntu)
Step 1: Install Selenium RC Server: From http://www.seleniumhq.org/download/, Download "selenium-server-standalone-2.xx.0.jar" and move to "/usr/local/bin". JDK/JRE is needed to run Selenium Server.

Step 2: Install PHPUnit-Selenium (for Ubuntu) for writing Selenium test script in PHPUnit.

$ sudo apt-get install phpunit-selenium
The PHPUnit-Selenium provides the Selenium RC PHPUnit extension for integrating Selenium test cases in a PHPUnit test suite.

4.2  Getting Started with Selenium 1 (with PHP) by Examples
Example 1: Login Success and Failure Tests
We shall use the login form presented in the previous section as example. Assuming that the URL for the login page is http://localhost/login.php.

The following test script ("LoginTest.php") can be used to test the login-success and login-failure functions.

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
<?php
class TestLogin extends PHPUnit_Extensions_SeleniumTestCase {
   protected function setUp() {
      $this->setBrowser("*firefox");
      $this->setBrowserUrl("http://localhost/");
   }
 
   public function testLoginPass() {
      $this->open('/login.php');
      $this->type('id=username', 'test');
      $this->type('id=password', 'pwcorrect');
      $this->click('css=input[type=\'submit\']');
      $this->waitForPageToLoad('30000');
      $this->assertEquals("http://localhost/main.php", $this->getLocation());
      $this->assertTextPresent('Welcome');
   }
 
   public function testLoginFail() {
      $this->open("/login.php");
      $this->type("id=username", "testwrong");
      $this->type("id=password", "pwwrong");
      $this->click("css=input[type=\"submit\"]");
      $this->waitForPageToLoad("30000");
      $this->assertTextPresent('exact:Wrong username or password!');
//    $this->assertEquals("Wrong username or password!", $this->getText("id=loginError"));
   }
}
?>
Running the Test
To run the PHPUnit test script

First launch the Selenium Server:
$ java -jar /usr/local/bin/selenium-server-standalone-2.37.0.jar
Then, run the Selenium test script via PHPUnit:
$ phpunit --verbose LoginTest.php
PHPUnit 3.6.10 by Sebastian Bergmann.
..
Time: 27 seconds, Memory: 3.50Mb
OK (2 tests, 3 assertions)
Explanation:
The setBrowser() specifies the browser used for running the test, which includes *firefox, *iexplore, *chrome, *safari, and others.
The setBrowserUrl() sets the base URL. All URL references are relative to this base URL.
[TODO]
Example 2
[TODO]

4.3  Code Coverage
In software testing, code coverage measures the degree for which the source program is tested. It could be measured in terms of the lines, functions, branches, decisions covered by the tests.

PHPUnit_Extensions_SeleniumTestCase can collect code coverage information for tests run through Selenium RC. To set up code coverage:

Copy PHPUnit/Extensions/SeleniumCommon/phpunit_coverage.php (in folder /usr/share/php/) into your webserver's document root directory.
In your webserver's php.ini (in folder /etc/php5/apache2) configuration file, configure PHPUnit/Extensions/SeleniumCommon/prepend.php and PHPUnit/Extensions/SeleniumCommon/append.php (in folder /usr/share/php/) as the auto_prepend_file and auto_append_file.
In your test case class that extends PHPUnit_Extensions_SeleniumTestCase, include:
protected $coverageScriptUrl = 'http://host/phpunit_coverage.php';
To run test cases with code coverage:
// Start the Selenium RC server:
$ java -jar /usr/local/bin/selenium-server-standalone-2.37.0.jar
 
// Run test case with code coverage enabled
$ phpunit --verbose --coverage-html ./codeCoverageReport XxxTest.php
The code coverage report would be generated in directory codeCoverageReport, which shows the lines, functions/methods and classes covered by the tests.

5.  Selenium 2 (Selenium WebDriver)
5.1  Installing Selenium WebDriver for Java
Selenium WebDriver is available in many languages, such as Java, C#, Python, Perl, PHP and Ruby. I shall describe the Java version.

From http://www.seleniumhq.org/download/, under "Selenium Client & WebDriver Language Bindings", Select "Java" download "selenium-java-2.##.0.zip".
Unzip the download file into a folder of your choice (e.g., /usr/local/selenium-2.##.0).
5.2  Getting Started with Selenium WebDriver
I shall assume that your are familiar with Java, and use Eclipse as IDE.

Launch Eclipse, create a new Java project (say SeleniumTest).
Include Selenium JAR file: Right-click on the project ⇒ Properties ⇒ Java Build Path ⇒ Libraries ⇒ ADD External JARs ⇒ navigate to "selenium-2.##.0" and select "selenium-java-2.##.0.jar".
Repeat the above step to include all the JAR file in the "libs" directory.
For Firefox and HTMLUnit, you do not need to install any driver. For IE, Chrome, Safari and other browsers, you need to install the appropriate driver from Selenium Download site.
[TODO]

REFERENCES & RESOURCES

PHPUnit Manual @ http://phpunit.de/manual/current/en/index.html.
Selenium Mother Site @ http://www.seleniumhq.org/ and documentation @ http://www.seleniumhq.org/docs/.
Selenium Tutorial @ http://www.guru99.com/selenium-tutorial.html.
