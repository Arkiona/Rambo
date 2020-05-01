# Rambo
Rambo HTTP CLI Brute-forcer


Simple Ruby based HTTP brute-forcer supporting custom name and password parameters and up to two custom fields. Doesn't support GET as there as logins rarely use GET.

-u allows you to set the custom username parameter. You can find this by capturing the login request in burp or similar tool
-p allows you to set the custom password parameter. You can find this by capturing the login request in burp or similar tool
-d sets the domain. Include the full path to the login. i.e /app/login.php
-w wordlist. Wordlist file needs to be : seperated (username:password)
-f sets the failed login message. i.e Invalid username or password

see -h for more:

 ruby rambo.rb -h
Options:
  -s, --simpleexample=<s>        ruby rambo.rb -w test.txt -d http://172.16.139.221/app2/index.php  -u username -p password  -f  No account found with that username. 
  -a, --advexample=<s>           ruby rambo.rb -w test.txt -d http://172.16.139.221/app2/index.php  -u username -p password -c customparam1 -t custominput1 -o customparam2 -m customvalue2 -f  No account found with that username.
  -w, --wordlist=<s>             Wordlist Filename - username:password format
  -d, --domain=<s>               domain and path to login - https://127.0.0.1/login.php
  -u, --userparameter=<s>        Username parameter - parameter name that sends the username
  -p, --passwordparameter=<s>    Password parameter - parameter name that sends the password
  -c, --customparamname1=<s>     Custom Parameter Name one
  -t, --customparamvalue1=<s>    Custom Parameter value one
  -o, --customparamname2=<s>     Custom Parameter Name Two
  -m, --customparamvalue2=<s>    Custom Parameter value Two
  -f, --failedlogin=<s>          Enter failed login string - i.e invalid username and password
  -h, --help                     Show this message
  
  
  
