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
* Modern single core CPU, dual core is recommended if you want to upload high volume of books.
* Minimum 256MB of RAM, 2GB is recommended if you want to enable full-text search with Elasticsearch.
* 64 bit Linux compatible with Docker.
* Docker 17.05 or higher.
* Docker Compose.

## Install
By Default, LibreRead offers a metadata search. But if you want to enable full-text search across all the book content, you will need to enable Elasticsearch by entering `Y` when the install script prompts for that.

* `wget https://github.com/LibreRead/server/archive/v1.2.3.tar.gz --output-document=libreread.tar.gz`
* `mkdir -p /var/libreread && tar xf libreread.tar.gz -C /var/libreread --strip-components 1 && rm libreread.tar.gz`
* `cd /var/libreread`
* `./install.sh`

You will be prompted for Domain address, SMTP settings and Elasticsearch prompts (if you want to enable Elasticsearch). Once you have entered those prompts, the script will install and start the server at **http://ip_address:8080**
