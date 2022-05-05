#!/bin/bash

parametro=$1

function main {
 #install_epel_package
 #deploy_nginx
 #change_index_html

if [ -z $parametro ]
	then
		echo "El valor del parametro esta vacio"
	else
		if [[ "$parametro"  == "nginx" ]]
			then
				#echo "Esoy instalando nginex"
				deploy_nginx
			else
				#echo "EStoy instalando http"
				install_httpd
		fi
fi
}

function install_epel_package {
#sudo yum install epel-release -y
 echo "INstalando package epel ...."
}

function deploy_nginx {
 sudo yum install nginx -y
 sudo systemctl start nginx
 sudo systemctl enable nginx
}

function install_httpd {
yum update
yum install httpd -y
systemctl start httpd
systemctl enable httpd
}

function change_index_html {
 echo "Juan Jose Tabares" > /usr/share/nginx/html/index.html
}

main
