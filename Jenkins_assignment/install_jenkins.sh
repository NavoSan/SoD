#! /bin/bash

#Download Java if it's not in the service

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

#Download and Install Jenkins, but first verify if packages are installed, if not, it install the dependencies
sudo apt-get install jenkins

if ! [ $? -eq 0 ]; then
    read -p "Dependencies are not installed. You want to install it? [y/n]" ans2
    if [ $ans2 == 'y' ];then
        wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
        sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
        sudo apt update
        sudo apt-get install jenkins
    else
        echo -e "\n Jenkins cannot be installed without the dependencies"
    fi
fi

echo "Installing jenkins"


#Install node and npm to be able to build the nodejs app

if ! [ $(which node 2>/dev/null) ]; then
    echo -e "Node is not installed. Donwloading Node "
    sudo apt install node
fi

if ! [ $(which npm 2>/dev/null) ]; then
    echo -e "Node is not installed. Donwloading Node "
    sudo apt install npm
fi

# Start Jenkins
sudo service jenkins start

# Print the initial Jenkins password
echo "The initial Jenkins password is: "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword