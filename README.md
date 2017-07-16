# composer
```
docker-compose run --rm composer composer -vvv update --ignore-platform-reqs --no-scripts
docker-compose run --rm composer composer dump-autoload
docker-compose exec hrmstest php artisan clear-compiled
docker-compose exec hrmstest php artisan optimize
```

# npm
```
# for first time
docker-compose run --rm node yarn install 

docker-compose run --rm node yarn upgrade
docker-compose run --rm node yarn run build
```
