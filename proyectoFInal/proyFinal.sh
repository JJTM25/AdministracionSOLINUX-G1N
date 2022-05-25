#!/bin/bash

param=$1

function main {
	case $param in
		nginx) 
			install_nginx;;
		http)
			install_http;;
		releaseOS)
			consultar_release_SO;;
		requestDNS)
			consultar_dns;;
		gateway)
			consultar_gateway;;
		selinux)
			consultar_selinux;;
		firewall)
			opciones_firewall;;
		infoPasswd)
			info_passwd;;
		disks)
			listar_Discos;;
		tim)
			tim;;
		process)
			procesos;;
		help)
			help;;
		*) 
			echo "opcion incorrecta, escriba help para ayuda";;
	esac
}

function install_nginx {
	echo "----//-----//----//----//----//----//---- INSTALANDO NGINX ----//----//-----//-----//----//----//----"
	sudo yum install epel-release
	sudo yum repolist
	sudo yum install nginx -y
	sudo systemctl start nginx
	sudo systemctl enable nginx
	echo "----//----//----//----//----//----//---- TERMINO DE INSTALAR NGINX ----//----//----//----//----//----"
}

function install_http {
	echo "----//-----//----//----//----//----//---- INSTALANDO HTTP ----//----//-----//-----//----//----//----"
	sudo yum install httpd -y
	systemctl start htppd
	systemctl enable httpd
	echo "----//-----//----//----//----//----//----TERMINO DE INSTALAR HTTP----//-----//-----//----//----//----"
}

function consultar_release_SO {
	echo "----//-----//----//----//----//----INICIO CONSULTA RELEASE DEL SO----//-----//-----//----//----//----"
	cat /etc/*release
	echo "----//-----//----//----//----//----TERMINA CONSULTA RELEASE DEL SO----//-----//-----//----//----//----"
}

function consultar_dns {
	echo "----//-----//----//----//----//----//----INICIO CONSULTA DNS----//----//-----//-----//----//----//----"
	cat /etc/resolv.conf
	echo "----//-----//----//----//----//----//----TERMINA CONSULTA DNS---//----//-----//-----//----//----//----"
}

function consultar_gateway {
	echo "Consultar el gateway del servidor"
}

function consultar_selinux {
	echo "Consultar el estado de selinux"
}

function opciones_firewall {
	echo "Listar las opciones de firewall configuradas"
}

function info_passwd {
	echo "Mostrar la informacion del archivo /etc/passwd"
}

function listar_discos {
	echo "Listar los discos duros del servidor"
}

function tim {
	echo "Saber el tiempo que lleva prendido el servidor"
}

function procesos {
	echo "Conocer los proncesos del servidor"
}

function help {
	echo "Ingrese:
		nginx: Para instalar ngnx
		http: Para instalar http
		releaseOS: Consultar el release del sistema operativo
		requestDNS: consultar el servidor dns de un servidor
		gateway: Consultar el gateway del servidor
		selinux: Consultar el estado de selinux
		firewall: Listar las opciones de firewall configuradas
		infoPasswd: Mostrar la informacion del archivo /etc/passwd
		disks: Listar los discos duros y particiones del servidor
		tim: Saber el tiempo que lleva encendido el servidor
		process: Conocer los procesos del servidor"
}

main
