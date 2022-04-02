#!/bin/bash

function main {
 install_epel_package
 deploy_nginx
 change_index_html
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

function change_index_html {
 echo "Juan Jose Tabares" > /usr/share/nginx/html/index.html
}

main
