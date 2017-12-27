#!/bin/bash

# Copyright 2017 Nirmal Kumar

# This file is part of LibreRead.

# LibreRead is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# LibreRead is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with LibreRead.  If not, see <http://www.gnu.org/licenses/>.

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

[ -e .env ] && rm .env

echo "LIBREREAD_DOMAIN_ADDRESS=$domain_address
LIBREREAD_SMTP_SERVER=$smtp_server
LIBREREAD_SMTP_PORT=$smtp_port
LIBREREAD_SMTP_ADDRESS=$smtp_address
LIBREREAD_SMTP_PASSWORD=$smtp_password" >> .env

echo "Do you want to enable full-text search with ElasticSearch [Y/n] ?"
read enableES

docker-compose up -d redis

if [[ $enableES == "y" || $enableES == "Y" || $enableES == "yes" || $enableES == "Yes" ]]
then
    sysctl -w vm.max_map_count=262144

    docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml up -d elasticsearch

    docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml run wait
    
    docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml build libreread
    
    ExecStart="/usr/local/bin/docker-compose -f docker-compose.yml -f docker-compose.elasticsearch.yml up libreread"
else
    docker-compose build libreread
    
    ExecStart="/usr/local/bin/docker-compose up libreread"
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