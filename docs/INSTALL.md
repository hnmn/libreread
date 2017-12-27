<!---Copyright 2017 Nirmal Kumar--->

<!---This file is part of LibreRead.--->

<!---LibreRead is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.--->

<!---LibreRead is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.--->

<!---You should have received a copy of the GNU Affero General Public License
along with LibreRead.  If not, see <http://www.gnu.org/licenses/>.--->

## Requirements to run the install script
* Install Docker 17.05 or higher
* Install Docker Compose

## Install
* `wget https://github.com/LibreRead/server/archive/v1.1.3.tar.gz --output-document=libreread.tar.gz`
* `mkdir -p /var/libreread && tar xf libreread.tar.gz -C /var/libreread --strip-components 1 && rm libreread.tar.gz`
* `cd /var/libreread`
* `./install.sh`

You will be prompted for Domain address, SMTP settings and Elasticsearch prompts (if you want to enable Elasticsearch). Once you have entered those prompts, the script will install and start the server at **http://ip_address:8080**
