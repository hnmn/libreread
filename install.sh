#!/bin/bash

echo Please enter your domain address, Eg: www.example.com
read domain_address

echo Please enter your SMTP server, Eg: smtp.fastmail.com
read smtp_server

echo Please enter your SMTP port, Eg: 587/465
read smtp_port

echo Please enter your SMTP email address, Eg: info@example.com
read smtp_address

echo Please enter your SMTP password. This will be application-specific password or email password
read smtp_password

echo "Do you want to enable full-text search with ElasticSearch [Y/n] ?"
read enableES

if [[ $enableES == "y" || $enableES == "Y" || $enableES == "yes" || $enableES == "Yes" ]]
then
    ES=1
else
    ES=0
fi

[ -e .env ] && rm .env

echo "LIBREREAD_DOMAIN_ADDRESS=$domain_address
LIBREREAD_SMTP_SERVER=$smtp_server
LIBREREAD_SMTP_PORT=$smtp_port
LIBREREAD_SMTP_ADDRESS=$smtp_address
LIBREREAD_SMTP_PASSWORD=$smtp_password
LIBREREAD_ELASTICSEARCH=$ES" >> .env

docker-compose up -d redis

if [ $ES -eq 1 ]
then
    sysctl -w vm.max_map_count=262144

    docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml up -d elasticsearch

    docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml run wait
    
    docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml build libreread
    
    ExecStart="/usr/local/bin/docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml run libreread"
else
    docker-compose build libreread
    
    ExecStart="/usr/local/bin/docker-compose run libreread"
fi

[ -e libreread.service ] && rm libreread.service

echo "[Unit]
Description=LibreRead systemd service

[Service]
User=root
Group=root
WorkingDirectory=/var/libreread
ExecStart=$ExecStart

[Install]
WantedBy=multi-user.target" >> libreread.service

mv libreread.service /lib/systemd/system/libreread.service

systemctl enable libreread.service

systemctl start libreread.service