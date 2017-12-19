FROM golang:alpine as builder
RUN apk add --no-cache musl-dev gcc git
WORKDIR /go/src/github.com/LibreRead/server
COPY . .
RUN go-wrapper download
RUN go-wrapper install ./cmd/server/

FROM alpine
RUN apk add --no-cache unzip poppler-utils ca-certificates
WORKDIR /libreread
ENV LIBREREAD_ASSET_PATH "/usr/local/share/libreread"
COPY templates $LIBREREAD_ASSET_PATH/templates
COPY static $LIBREREAD_ASSET_PATH/static
COPY --from=builder /go/bin/server /usr/bin/server
VOLUME /libreread
EXPOSE 8080
ENTRYPOINT ["server"]
