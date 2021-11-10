#!/bin/bash
#sudo apt-get update
#sudo apt install apache2 -y
#sudo apt install jq -y
#sudo apt-get clean
log=$(date)
log+=", Tomasz Smyk, apache nasluchuje na porcie 80"
touch log.txt
echo $log > log.txt
cd /var/www/html/
#sudo chmod 777 /var/www/html -R
rm index.html
touch index.html
# timezone=$(curl -s https://ipinfo.io/geo | jq -r '.timezone')
ip=$(curl -s https://ipinfo.io/geo | jq -r '.ip')
# url="http://worldtimeapi.org/api/timezone/$timezone"
# time=$((curl -s $url) | jq -r '.datetime')
echo "<!DOCTYPE html>" >> index.html
echo "<html>" >> index.html
echo "<head>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "<p>" >> index.html
 echo $ip >> index.html
echo "</p>" >> index.html
echo "<p id='time'>" >> index.html
echo "</p>" >> index.html
echo "<script>" >> index.html
echo "document.getElementById('time').innerHTML = new Date();" >> index.html
echo "</script>" >> index.html
echo "</body>" >> index.html
echo "</html> " >> index.html
