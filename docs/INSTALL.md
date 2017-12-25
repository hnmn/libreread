## Requirements to run the install script
* Install Docker 17.05 or higher
* Install Docker Compose

## Install
* `wget https://github.com/LibreRead/LibreRead/archive/v1.1.1.tar.gz --output-document=libreread.tar.gz`
* `mkdir -p /var/libreread && tar xf libreread.tar.gz -C /var/libreread --strip-components 1`
* `cd /var/libreread`
* `./install.sh`

You will be prompted for Domain address, SMTP settings and Elasticsearch prompts (if you want to enable Elasticsearch). Once you have entered those prompts, the script will install and start the server at **http://ip_address:8080**
