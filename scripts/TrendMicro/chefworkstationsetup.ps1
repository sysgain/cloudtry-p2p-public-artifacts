Enable-PSRemoting -Force

. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -channel current -project chefdk

iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco install visualstudiocode

git clone 
