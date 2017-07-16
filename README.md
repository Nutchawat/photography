# Build
```
git clone --depth 1 -b docker-apache2 https://github.com/ppshrms/ess-docker.git && cd -
chmod +x build && ./build 192.168.2.81 8080 8433 v2.1.5
```

# composer
```
dc run --rm composer composer -vvv update --ignore-platform-reqs --no-scripts
dc run --rm composer composer dump-autoload
dc exec hrmstest php artisan clear-compiled
dc exec hrmstest php artisan optimize
```

# npm
```
# for first time
dc run --rm node yarn install 

dc run --rm node yarn upgrade
dc run --rm node yarn run build
```

# SSL
```
# Self sign
openssl req \
    -nodes -x509 -newkey rsa:2048 \
    -keyout ess.key -out ess.crt \
    -subj "//C=TH\ST=Bangkok\L=Bangkok\O=PEOPLE PLUS SOFTWARE CO., LTD.\OU=ESS Online\CN=ess.peopleplus.co.th"
```

# Oracle Database
```
git clone https://github.com/oracle/docker-images.git && cd docker-images/OracleDatabase/dockerfiles/
chmod +x buildDockerImage.sh && ./buildDockerImage.sh -s -v 12.1.0.2
```