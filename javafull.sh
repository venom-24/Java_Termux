#! data/data/com.termux/files/usr/bin/bash

#VARIABLES

                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'       
		magenta='\033[1;35m'                           
		cyan='\033[1;36m'                                   
		reset='\033[0m'



echo -e "\e[1;36mINSTALANDO JAVA"                
echo
echo
#Verificando si existe java

if [ -e $PREFIX/bin/java ]
then
        echo -e "\e[1;36mJava ya esta instalado"                                             
	echo
        exit
else

	case `dpkg --print-architecture` in            
	aarch64)                                            archname="aarch64"; tag="java_aarch" ;;                                                
arm64)
 archname="aarch64"; tag="java_aarch" ;;                                                
armhf)
 archname="arm"; tag="java" ;;           
armv7l)                                                
archname="arm"; tag="java" ;;           
arm)                                                    
archname="arm"; tag="java" ;;           
*)                                                    
tt "\e[1;31mERROR: Arquitectura no compatible"; echo; 
exit ;;                                 
esac   
clear

#Java instalacion

echo -e "\e[1;36m[*] \e[1;36mDownloading Java 8 For Termux ( required 80mb ) ${archname}    "

wget https://github.com/venom-24/beef-24/releases/download/${tag}/jdk8_${archname}.tar.gz -q

echo -e "\e[1;36m[*] \e[1;36mMover JDK al systema..."
mv jdk8_${archname}.tar.gz $PREFIX/share

echo -e "\e[32m[*] \e[34mExtrayendo JDK"

cd $PREFIX/share                              
tar -xhf jdk8_${archname}.tar.gz

echo -e "\e[32m[*] \e[1;36Configuracion de java_home"

export JAVA_HOME=$PREFIX/share/jdk8
echo "export JAVA_HOME=$PREFIX/share/jdk8" >> $HOME/.profile

#echo -e "\e[32m[*] \e[34mCoping Java wrapper scripts to bin..."

cp bin/* $PREFIX/bin

echo -e "\e[1;36m[*] \e[1;36mLimpiando archivos temporales"

rm -rf $HOME/installjava                       
rm -rf $PREFIX/share/jdk8_${archname}.tar.gz                                                  
rm -rf $PREFIX/share/bin

echo                                           
echo -e "\e[32mJava se a instalado correctamente\e[39m"

fi




