To reference a variable in Windows, use %varname% (with prefix and suffix of '%'). For example, you can use the echo command to print the value of a variable in the form "echo %varname%".

// Display the PATH environment variable
echo %PATH%
PATH=xxxxxxx
   
// Append a directory in front of the existing PATH
set PATH=c:\myBin;%PATH%
PATH=c:\myBin;[existing entries]