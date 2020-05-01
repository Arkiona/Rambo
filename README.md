# Rambo
<pre>
Rambo HTTP CLI Brute-forcer


Simple Ruby based HTTP brute-forcer supporting custom name and password parameter. Also allows up to two custom fields. Doesn't support GET as there as logins rarely use GET.

-u allows you to set the custom username parameter. You can find this by capturing the login request in burp or similar tool
-p allows you to set the custom password parameter. You can find this by capturing the login request in burp or similar tool
-d sets the domain. Include the full path to the login. i.e /app/login.php
-w wordlist. Wordlist file needs to be : seperated (username:password)
-f sets the failed login message. i.e Invalid username or password

simple example:
 ruby rambo.rb -w test.txt -d http(s)://127.0.0.1/app2/index.php  -u username -p password  -f   No account found with that username
 
 Complex example:
 
ruby rambo.rb -w test.txt -d http(s)://127.0.0.1/app2/index.php  -u username -p password -c customparam1 -t custominput1 -o customparam2 -m customvalue2 -f  No account found with that username.
 
see rambo.rb -h for more

Install the following gems: (gem install name) from your terminal
'Typhoeus'
'hydra'
'optimist'
'colorize'



Enable proxy:
change the following line:

Typhoeus::Request.new(domain, followlocation: true, 

To

Typhoeus::Request.new(domain,:proxy => "http://127.0.0.1:8080", followlocation: true,                            
</pre>



Advisory
All the scripts listed in this repository should only be used for authorized penetration testing and/or educational purposes. Any misuse of this software will not be the responsibility of the author or of any other collaborator. Use it on your own networks and/or systems with the network owner's permission. Furthermore, please use at your own risk as the author or any other collaborator are not responsible for any issues or trouble caused!

