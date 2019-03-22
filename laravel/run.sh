#!/bin/bash
set -e

# port to laravel
PORT=8080

BASE="/var/www"

run() {
    # start laravel server
    php artisan serve --host=0.0.0.0 --port=${PORT} &

    # build react with hot module replacement
    npm run hot
}

# check if app is available
if [ ! "$(ls -A ${BASE})" ]
then
    echo -e "\n--------------------------------------------------------------------------\n"
    echo "Folder /var/www/ is empty. Nothing to serve."
    echo "You should clone the app first and create a volume like: ../app:/var/www"
    echo "Exit."
    exit 0
fi

# may install PHP packages
if [ ! "$(ls -A ${BASE}/vendor)" ]
then
    echo -e "\n--------------------------------------------------------------------------\n"
    echo "PHP composer folder /var/www/vendor is empty. I'm trying to install packages ..."
    cd ${BASE}
    composer install
fi

# may install javascript packages
if [ ! "$(ls -A ${BASE}/node_modules)" ]
then
    echo -e "\n--------------------------------------------------------------------------\n"
    echo "Node modules folder /var/www/node_modules is empty. I'm trying to install packages ..."
    cd ${BASE}
    npm install
fi

if [ ! -f "${BASE}/.env" ]
then
    echo -e "\n--------------------------------------------------------------------------\n"
    echo "Laravel config file .env not found."
    echo "Crate .env from .env.example ..."
    cd ${BASE}
    cp .env.example .env
    echo "Replace default DB_HOST ..."
    sed -i -e 's/DB_HOST=127.0.0.1/DB_HOST=mysql/g' .env
    echo "Generate laravel application key ..."
    php artisan key:generate
    echo "Please check if that values fits your requirements"
fi

run