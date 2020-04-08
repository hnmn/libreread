<!---Copyright 2017-2020 Nirmal Kumar--->

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

# LibreRead [Maintainers needed]

Self-hosted Free(Libre) Ebook Reader where you can highlight & annotate content. It supports PDF & EPUB formats. This project is not under active development and we are expecting maintainers who could take this up and improve this software.

![Alt text](/static/img/screenshot.png?raw=true "Home Page")

### Features
 - Easy installation
 - Built using Golang
 - Browser-based
 - Responsive design
 - Full-text search
 - Highlight & Annotate
 - Supports PDF & EPUB
 
### Production setup
Please check [this guide](https://github.com/mysticmode/libreread/blob/master/docs/INSTALL.md)

### Development setup
Install go 1.9 or higher, redis 4 (default settings on port 6379) and optionally elasticsearch 5 (default settings on port 9200). If you want to use elasticsearch, do `export LIBREREAD_ELASTICSEARCH=1` and run the following commands.
 - `go get -d github.com/LibreRead/server/cmd/libreread`
 - `cd $GOPATH/src/github.com/LibreRead/server`
 - `go run ./cmd/libreread/main.go`
 
 This will run the app on `localhost:8080`
