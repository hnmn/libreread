## Requirements to run the install script
* Install Git
* Install Docker 17.05 or higher
* Install Docker Compose

## Install
* `git clone https://github.com/LibreRead/LibreRead.git /var/libreread --depth 1`
* `cd /var/libreread`
* `./install.sh`

You will be prompted for Domain address, SMTP settings and Elasticsearch prompts (if you want to enable Elasticsearch). Once you have entered those prompts, the script will install and start the server at **http://ip_address:8080**
