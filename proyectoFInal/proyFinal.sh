#!/bin/bash

param=$1
mesagge=$2

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
		messag)
			print_mssg;;
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
	echo "----//-----//----//----//----//----//--INICIO CONSULTA GATEWAY--//----//-----//-----//----//----//----"
	route -n	
	echo "----//-----//----//----//----//----//-TERMINA CONSULTA GATEWAY-//----//-----//-----//----//----//----"
}

function consultar_selinux {
	echo "----//-----//----//----//----//----//--INICIO CONSULTA SELINUX--//----//-----//-----//----//----//----"
	getenforce
	echo "----//-----//----//----//----//----//--TERMINA CONSULTA SELINUX--//----//-----//-----//----//----//----"
}

function opciones_firewall {
	echo "----//-----//----//----//----//----//--INICIO CONSULTA FIREWALL--//----//-----//-----//----//----//----"
	sudo yum install firewalld
	firewall-cmd --list-all
	echo "----//-----//----//----//----//---//--TERMINA CONSULTA FIREWALL--//---//-----//-----//----//----//----"
}

function info_passwd {
	echo "----//-----//----//----//----//----//----INICIO INFO PASSWD----//----//-----//-----//----//----//----"
	cat /etc/passwd
	echo "----//-----//----//----//----//----//----TERMINA INFO PASSWD---//----//-----//-----//----//----//----"
}

function print_mssg {
	echo "----//-----//----//----//----//----//----INICIO Print Mensaje----//----//-----//-----//----//----//----"
	echo $2
	echo "----//-----//----//----//----//----//----TERMINA Print Mensaje---//----//-----//-----//----//----//----"
}

function listar_Discos {
	echo "----//-----//----//----//----//--//-INICIO  CONSULTA DISCOS DUROS-//--//-----//-----//----//----//----"
	lsblk
	echo "----//-----//----//----//----//--//-TERMINA CONSULTA DISCOS DUROS-//--//-----//-----//----//----//----"
}

function tim {
	echo "----//-----//----//----//----//---INICIO CONSULTA TIEMPO DEL SISTEMA---//-----//-----//----//----//----"
	uptime
	echo "----//-----//----//----//----//---TERMINA CONSULTA TIEMPO DEL SISTMA---//-----//-----//----//----//----"
}

function procesos {
	echo "----//-----//----//----//------INICIO CONOCER LOS PROCESOS DEL SISTEMA-------//-----//----//----//----"
	top
	echo "----//-----//----//----//-----TERMINA CONOCER LOS PROCESOS DEL SISTEMA------//-----//----//----//----"
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
		mesagg: Para imprimir un mensaje
		disks: Listar los discos duros y particiones del servidor
		tim: Saber el tiempo que lleva encendido el servidor
		process: Conocer los procesos del servidor"
}

main
