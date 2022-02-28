#!/bin/bash
echo " "
jeshile='\e[40;38;5;82m'
jo='\e[0m'
os=$(exec uname -m|grep 64)
if [ "$os" = "" ]
then os="x86"
else os="x64"
fi

DIRE=$(hostname -I)
DIREMODE=$(expr "$DIRE" : '\(.*\).')

echo -e "${jeshile} +-----------------------------+ \e[0m"
echo -e "${jeshile} ¦Revisando Version del sistema¦ \e[0m"
echo -e "${jeshile} +-----------------------------+ \e[0m"
sleep "5"

echo -e "${jeshile} +------------------------------+ \e[0m"
echo -e "${jeshile} ¦Sistema de $os Bits Detecatado¦ \e[0m"
echo -e "${jeshile} +------------------------------+ \e[0m"
sleep "5"

echo -e "${jeshile} +--------------------------------+ \e[0m"
echo -e "${jeshile} ¦   Prerequisitos para instalar  ¦ \e[0m"
echo -e "${jeshile} ¦       LAMP y Panel admin       ¦ \e[0m"
echo -e "${jeshile} ¦                                ¦ \e[0m"
echo -e "${jeshile} ¦  1 Usuario admin de MYSQL      ¦ \e[0m"
echo -e "${jeshile} ¦  2 Contraseña admin de MySql   ¦ \e[0m"
echo -e "${jeshile} ¦  3 Contraseña root de MySql    ¦ \e[0m"
echo -e "${jeshile} +--------------------------------+ \e[0m"
echo ""
echo ""
sleep "8"




echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Escribe un usuario     ¦ \e[0m"
echo -e "${jeshile} ¦      para MYSQL           ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} ¦    NOTA NO USES ROOT      ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} ¦    ejemplo: admin         ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep "3"

read USERMYSQL
echo "Tu Usuario de administrador para Mysql es: $USERMYSQL"
echo ""


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo -e "${jeshile} ¦     admin para Mysql      ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} ¦ Usa una contraseña segura ¦ \e[0m"
echo -e "${jeshile} ¦ que contenga numeros      ¦ \e[0m"
echo -e "${jeshile} ¦ mayusculas minusculas     ¦ \e[0m"
echo -e "${jeshile} ¦ caracteres especiales     ¦ \e[0m"
echo -e "${jeshile} ¦ de diez digitos           ¦ \e[0m"
echo -e "${jeshile} ¦ ejemplo AdmiN2@9#h        ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep "3"

read CONTRAMYSQLADMIN
echo "Tu Contraseña de administrador para Mysql es: $CONTRAMYSQLADMIN"
echo ""



echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo -e "${jeshile} ¦      root para Mysql      ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} ¦ Usa una contraseña segura ¦ \e[0m"
echo -e "${jeshile} ¦ que contenga numeros      ¦ \e[0m"
echo -e "${jeshile} ¦ mayusculas minusculas     ¦ \e[0m"
echo -e "${jeshile} ¦ caracteres especiales     ¦ \e[0m"
echo -e "${jeshile} ¦ de diez digitos           ¦ \e[0m"
echo -e "${jeshile} ¦ ejemplo RooT12@9#hX       ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep "3"

read CONTRAMYSQLROOT
echo "Tu Contraseña de Mysql Root  es: $CONTRAMYSQLROOT"
echo ""



echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Actulizando el sisteama  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep "5"

sudo apt update -y


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦     Instalando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep "5"

sudo apt install apache2 -y


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Habilitando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep "5"

sudo ufw allow in "Apache"
sudo ufw allow in "Apache Full"


echo -e "${jeshile} +---------------------------------------+ \e[0m"
echo -e "${jeshile} ¦    Agregando repositorios MariaDb     ¦ \e[0m"
echo -e "${jeshile} +---------------------------------------+ \e[0m"
sleep "5"

sudo apt install -y software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.wtnet.de/mariadb/repo/10.5/ubuntu bionic main'
sudo apt update


echo -e "${jeshile} +---------------------------------------+ \e[0m"
echo -e "${jeshile} ¦    Instalando servidor MariaDb        ¦ \e[0m"
echo -e "${jeshile} +---------------------------------------+ \e[0m"
sleep "5"
sudo apt install mariadb-server mariadb-client -y



echo ""
echo -e "${jeshile} +-----------------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦    Configurando seguridad MariaDb                               ¦ \e[0m"
echo -e "${jeshile} ¦    Tu contraseña de Mysql es $CONTRAMYSQLROOT                   ¦ \e[0m"
echo -e "${jeshile} ¦                                                                 ¦ \e[0m"
echo -e "${jeshile} ¦    Enter password for user root:  Pon tu contraseña             ¦ \e[0m"
echo -e "${jeshile} ¦                                                                 ¦ \e[0m"
echo -e "${jeshile} ¦           ***  Cuando te pregunte ***                           ¦ \e[0m"
echo -e "${jeshile} ¦                                                                 ¦ \e[0m"
echo -e "${jeshile} ¦   Switch to unix_socket authentication [Y/n]        Presiona n  ¦ \e[0m"
echo -e "${jeshile} ¦                                                                 ¦ \e[0m"
echo -e "${jeshile} ¦   Change the root password? [Y/n]                   Presiona n  ¦ \e[0m"
echo -e "${jeshile} ¦   Remove anonymous users? [Y/n]                     Presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦   Disallow root login remotely? [Y/n]               Presiona Y  ¦ \e[0m"
echo -e "${jeshile} ¦   Remove test database and access to it? [Y/n]      Presiona Y  ¦ \e[0m"
echo -e "${jeshile} ¦   Reload privilege tables now? [Y/n]                Presiona Y  ¦ \e[0m"
echo -e "${jeshile} ¦                                                                 ¦ \e[0m"
echo -e "${jeshile} ¦                                                                 ¦ \e[0m"
echo -e "${jeshile} +-----------------------------------------------------------------+ \e[0m"
echo ""
sleep "5"
mysql_secure_installation


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Instalando PHP 7.2       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt install php libapache2-mod-php php-mysql -y

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Agreando PHP al Inicio   ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo sed -i 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm/g' /etc/apache2/mods-enabled/dir.conf

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Reiniciando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo systemctl restart apache2


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦ Actualizando Repositorios ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt update

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt install phpmyadmin php-mbstring php-gettext -y
sudo phpenmod mbstring
sudo systemctl restart apache2


echo " "
echo -e "${jeshile} +---------------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦                                                               ¦ \e[0m"
echo -e "${jeshile} ¦     Configurando Usuario de MYSQL y creando base de datos     ¦ \e[0m"
echo -e "${jeshile} ¦                                                               ¦ \e[0m"
echo -e "${jeshile} +---------------------------------------------------------------+ \e[0m"
echo " "
sleep "3"
mysql --user=root --password=$CONTRAMYSQLROOT -e "CREATE USER '$USERMYSQL'@'localhost' IDENTIFIED BY '$CONTRAMYSQLADMIN';"
mysql --user=root --password=$CONTRAMYSQLROOT -e "GRANT ALL PRIVILEGES ON *.* TO '$USERMYSQL'@'localhost' WITH GRANT OPTION;"
mysql --user=root --password=$CONTRAMYSQLROOT -e "FLUSH PRIVILEGES;"




echo -e "${jeshile} +------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦   Resolviendo error 613 de  PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +------------------------------------------+ \e[0m"
sleep 3
sudo sed -i 's/] == 1)/]) == 1)/g' /usr/share/phpmyadmin/libraries/sql.lib.php
sudo sed -i 's/'"'"')))/'"'"'))/g' /usr/share/phpmyadmin/libraries/sql.lib.php


echo -e "${jeshile} +------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦   Resolviendo error 532 de  PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +------------------------------------------+ \e[0m"
sleep 3
sudo sed -i 's/count($options)/count((array)$options)/g' /usr/share/phpmyadmin/libraries/plugin_interface.lib.php




echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Reiniciando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo service apache2 restart



echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando Python       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt-get install python -y



sudo wget https://raw.githubusercontent.com/melcocha14/lamp-ubuntu-18-xtreamui-libcurl4/main/tools/install.py


echo " "
echo -e "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦      Creditos y soporte melcocha14@gmail.com             ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Tus Datos de Acceso son:                            ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Datos acceso de PhpMyadmin                          ¦ \e[0m"
echo -e "${jeshile} ¦      Usuario: 	$USERMYSQL                             ¦ \e[0m"
echo -e "${jeshile} ¦      Contraseña: 	$CONTRAMYSQLADMIN                      ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Link de acceso Phpmyadmin                           ¦ \e[0m"
echo -e "${jeshile} ¦      http://$DIREMODE/phpmyadmin                         ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Datos de acceso Mysql                               ¦ \e[0m"
echo -e "${jeshile} ¦      Usuario: 	root                                   ¦ \e[0m"
echo -e "${jeshile} ¦      Contraseña: 	$CONTRAMYSQLROOT                       ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Guarda tus Datos en un lugar seguro                 ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Escribe el siguiente comando y escribe MAIN         ¦ \e[0m"
echo -e "${jeshile} ¦      python2 install.py                                  ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo " "
sleep 3


