#!/bin/sh

VERSION="1.1.2"
echo -n

[ "$1" = "-v" ] || [ "$1" = "--version" ] && echo "Deploying Script ESS Online. Version $VERSION" && exit

Prompt () {

    unset WIP
    unset HTTP
    unset HTTPS
    unset TAG
    unset DIP
    unset DPORT
    unset DUSER
    unset DPASS
    unset CNAME
    unset SNAME
    unset PHP
    unset YNHTTPS
    unset YNESS

    echo
    echo "Enter configuration please, leave bank if use default values in parentheses."
    echo
    read -p "   Web server IP address (localhost):  " WIP
    read -p "   Web server HTTP port (80):          " HTTP
    read -p "   Web server HTTPS port (443):        " HTTPS
    read -p "   Server name (localhost):            " SNAME
    read -p "   Image and Container name (esstest): " CNAME
    read -p "   PHP version (7.0):                  " PHP
    read -p "   Always HTTPS (y/N):                 " YNHTTPS
    read -p "   ESS Online 1 (y/N):                 " YNESS
    if echo "$YNESS" | grep -ivq "^y"; then
        read -p "   Version of code (master):          " TAG
        read -p "   Database IP address (192.168.2.10): " DIP
        read -p "   Database port (1522):               " DPORT
        read -p "   Database username (ESS_STA3):       " DUSER
        read -p "   Database password (ESS_STA3):       " DPASS
    fi

    [ -z "$WIP" ] && WIP="localhost"
    [ -z "$HTTP" ] && HTTP="80"
    [ -z "$HTTPS" ] && HTTPS="443"
    [ -z "$TAG" ] && TAG="master"
    [ -z "$DIP" ] && DIP="192.168.2.10"
    [ -z "$DPORT" ] && DPORT="1522"
    [ -z "$DUSER" ] && DUSER="ESS_STA3"
    [ -z "$DPASS" ] && DPASS="ESS_STA3"
    [ -z "$CNAME" ] && CNAME="esstest"
    [ -z "$SNAME" ] && SNAME="localhost"
    [ -z "$PHP" ] && PHP="7.0"

    echo
    echo "###################################################"
    echo "   Web server IP address:     $WIP"
    echo "   Web server HTTP port:      $HTTP"
    echo "   Web server HTTPS port:     $HTTPS"
    echo "   Server name:               $SNAME"
    echo "   Image and Container name:  $CNAME"
    echo "   PHP version:               $PHP"
    echo "   Always HTTPS:              $YNHTTPS"
    echo "   ESS Online 1:              $YNESS"
    if echo "$YNESS" | grep -ivq "^y"; then
        echo "   Version of code:       $TAG"
        echo "   Database IP address:   $DIP"
        echo "   Database port:         $DPORT"
        echo "   Database username:     $DUSER"
        echo "   Database password:     $DPASS"
    fi
    echo "###################################################"
    echo
    read -p "Are you sure? (y/N/q)" ynq

}

Deploy () {

    if echo "$YNESS" | grep -iq "^y"; then
        sed -i "s/\/public//g" php/000-default.conf
        sed -i '/RewriteRule/d' php/000-default.conf
        sed -i '/RewriteCond/d' php/000-default.conf
        sed -i "s/AllowOverride None/AllowOverride All/g" php/000-default.conf
    else
        git config --global credential.helper "cache --timeout=3600"
        git stash
        git pull
        if [ -d "essonline-backend" ]; then
            cd essonline-backend
            git fetch --all
        else
            git clone https://github.com/ppshrms/essonline-backend.git
            cd essonline-backend
            git submodule update --init --recursive --remote
        fi
        cd essonline-frontend
        git fetch --all
        git checkout "$TAG"
        cd ..
        if [ "$TAG" = "master" ]; then
            git checkout develop
            git pull origin develop
            cd essonline-frontend
            git pull origin master
            cd ..
        else
            git checkout "$TAG"
        fi
        cd ..
        cp essonline-backend/essonline-frontend/_ignore/env.js essonline-backend/essonline-frontend/env.js
        cp essonline-backend/essonline-frontend/_ignore/index.js essonline-backend/essonline-frontend/config/index.js
        cp essonline-backend/_ignore/module.php essonline-backend/config/module.php
        cp essonline-backend/_ignore/module_mapping.php essonline-backend/config/module_mapping.php
        cp essonline-backend/_ignore/.env essonline-backend/.env

        [ "$DIP" != "192.168.2.10" ] && sed -i "s/192.168.2.10/$WIP/g" essonline-backend/.env
        [ "$DPORT" != "1522" ] && sed -i "s/1522/$DPORT/g" essonline-backend/.env
        [ "$DUSER" != "ESS_STA3" ] && sed -i "s/DB_USERNAME=ESS_STA3/DB_USERNAME=$DUSER/g" essonline-backend/.env
        [ "$DPASS" != "ESS_STA3" ] && sed -i "s/DB_PASSWORD=ESS_STA3/DB_PASSWORD=$DPASS/g" essonline-backend/.env

        [ "$WIP" != "localhost" ] && sed -i "s/localhost/$WIP/g" essonline-backend/essonline-frontend/env.js
        [ "$HTTP" != "80" ] && sed -i "s/$WIP/$WIP:$HTTP/g" essonline-backend/essonline-frontend/env.js
        dc run --rm composer composer -vvv update --ignore-platform-reqs --no-scripts
        if [ -f essonline-backend/essonline-frontend/yarn.lock ]; then
            dc run --rm node yarn upgrade
        else
            dc run --rm node yarn install
        fi
        dc run --rm node yarn run build
    fi
    [ "$HTTP" != "80" ] && sed -i "s/\"80:80/\"$HTTP:80/g" docker-compose.yml
    [ "$HTTPS" != "443" ] && sed -i "s/\"443:443/\"$HTTPS:443/g" docker-compose.yml
    [ "$CNAME" != "esstest" ] && sed -i "s/esstest/$CNAME/g" docker-compose.yml

    DNET=$( docker network ls | grep essdocker_default )
    [ -z "$DNET" ] && docker network create essdocker_default

    [ $PHP != "5.5" ] && sed -i "s/5.5-apache/$PHP-apache/g" php/Dockerfile
    [ ${PHP%.*} -gt 6 ] && sed -i "s/oci8-2.0.12/oci8/g" php/Dockerfile

    if echo "$YNHTTPS" | grep -iq "^y"; then
        echo | tee -a php/ess.conf
        echo "<IfModule mod_rewrite.c>" | tee -a php/ess.conf
        echo "   RewriteEngine On" | tee -a php/ess.conf
        echo "   RewriteCond %{HTTPS} !=on" | tee -a php/ess.conf
        echo "   RewriteRule ^(.*)$ https://%{HTTP_HOST}/$1 [R=301,L]" | tee -a php/ess.conf
        echo "</IfModule>" | tee -a php/ess.conf
    fi
    echo | tee -a php/ess.conf
    echo "ServerName $SNAME" | tee -a php/ess.conf
    if [ "$SNAME" != "localhost" ]; then 
        sed -i "s/self/$SNAME/g" docker-compose.yml
        sed -i "s/#SSLCertificateChainFile/SSLCertificateChainFile/g" php/000-default.conf
    fi

    dc up -d --build --force-recreate $CNAME
    if echo "$YNESS" | grep -ivq "^y"; then
        dc exec $CNAME php artisan clear-compiled
        dc exec $CNAME php artisan optimize
    fi
    sudo systemctl restart docker

}

echo "    ____ ____ ____    ____ _  _ _    _ _  _ ____ "
echo "    |___ [__  [__     |  | |\ | |    | |\ | |___ "
echo "    |___ ___] ___]    |__| | \| |___ | | \| |___ "
echo

while true; do
    case $ynq in
        [Yy]* ) Deploy; break;;
        [Qq]* ) exit;;
        * ) Prompt;;
    esac
done

echo -n
