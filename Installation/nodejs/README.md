$ cd /usr/local/bin
 
// Create symlinks, may need to sudo
$ ln -s /path-to-nodejs/bin/node
$ ln -s /path-to-nodejs/bin/npm
 
// Set to executable, may need to sudo
$ chmod +x node
$ chmod +x npm

To set "node_modules" directory to NODE_PATH:

(For Windows) Read "How to add/set an environment variable".
(For macOS/Linux) Read "How to set an Environment variable".
Take note that the NODE_PATH may take multiple directories, separated by semicolon (;) in Windows, or colon (:) in macOS/Linux.



Running Node.js in REPL (Read-Evaluate-Print Loop) Command-Line Mode
Start a CMD/Terminal/Bash-Shell. Launch Node.js:

node
Welcome to Node.js v12.16.1.
Type ".help" for more information.
> .help
.break    Sometimes you get stuck, this gets you out
.clear    Alias for .break
.editor   Enter editor mode
.exit     Exit the repl
.help     Print this help message
.load     Load JS from a file into the REPL session
.save     Save all evaluated commands in this REPL session to a file
Press ^C to abort current expression, ^D to exit the repl

> console.log("hello, world")
hello, world
undefined   // return value of console.log() function
> .exit     // or Ctrl-C twice, or Ctrl-D
Node.js runs in the REPL (Read-Evaluate-Print Loop) mode - an interactive language shell. It takes a single user input, evaluates, and returns the result.

Executing JavaScript Source Files
Prepare a JavaScript called "hello.js" as follows:

// hello.js
console.log('hello, world');
You can run the Script under Node.js as follows:

node hello.js
hello, world



Node.js is bundled with a program called npm (Node Package Manager), which is used to maintain the JavaScript packages.

You can install other node packages easily via npm (Node Package Manager). For example,

// Install Less, a CSS preprocessor. May need to use "sudo" to write to the global directory
npm install -g less
      // -g (or --global) for all users
      // Installed under /usr/local/lib/node_modules/less
      // A symlink lessc created in /usr/local/bin
 
// Install Gulp, an automation tool. May need to use "sudo" to write to the global directory
npm install -g gulp
      // Installed under /usr/local/lib/node_modules/gulp
      // A symlink gulp created in /usr/local/bin



Create the following JavaScript file, and save as "app.js" in a directory of your choice.

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
// app.js
const http = require('http');  // 'http' module
const hostname = '127.0.0.1';  // ip for localhost
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;  // set the repsonse status code to 200 "OK"
  res.setHeader('Content-Type', 'text/plain');  // set the response MIME type
  res.end('hello, world');  // write and end the response
});

server.listen(port, hostname, () => {
  console.log(`HTTP Server listening at http://${hostname}:${port}/`);
});
Run the "app.js" using Node (as a standalone program) as follows, which starts a HTTP server process.

cd /path/to/JavaScript-Directory
node app.js
HTTP Server listening at http://127.0.0.1:3000/
Start a web browser (Chrome, Firefox). Issue URL http://localhost:3000/. You shall see a hello-world message.

To stop the server, press Ctrl-C (or Ctrl-Shift-C).

