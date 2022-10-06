#! /bin/bash

if [ $(which java 2>/dev/null) ]; then
    echo -e "Java is installed.\n"
else
    read -p "Java is not installed. You want to install it? [y/n]" ans
    if [ $ans == 'y' ];then
        echo "Installing Java SDK 11"
        sudo apt install -y openjdk-11-jdk
        echo -e "\n Dependencies successfully installed"
    else
        echo -e "\n Jenkins cannot be started without a Java extension"
    fi
fi

#Download and Install Jenkins

sudo apt-get install jenkins

if ! [ $? -eq 0 ]; then
    read -p "Dependencies are not installed. You want to install it? [y/n]" ans2
    if [ $ans2 == 'y' ];then
        wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
        sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    else
        echo -e "\n Jenkins cannot be installed without the dependencies"
    fi
fi
            
echo "Installing jenkins"
sudo apt update
sudo apt-get install jenkins

# Start Jenkins
sudo service jenkins start

echo "The initial Jenkins password is: "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword