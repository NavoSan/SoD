#!/usr/bin/bash

wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.26/bin/apache-tomcat-10.0.26.zip

if [ -f apache-tomcat-10.0.26.zip ];then
	echo "tomcat is here...unzziping"
	unzip apache-tomcat-10.0.26.zip
else
	echo "tomcat is not here"
fi

echo "moving tomcat"
mv apache-tomcat-10.0.26 tomcat
echo "adding permissions"
chmod +x tomcat/bin/*.sh
echo "changing directory"
cd tomcat/bin
echo "starting tomcat"
./startup.sh
