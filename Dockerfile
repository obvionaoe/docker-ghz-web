FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates
WORKDIR $GOPATH/src/
RUN git clone --depth 1 --branch v0.59.0 https://github.com/bojand/ghz
WORKDIR $GOPATH/src/ghz/cmd/ghz-web
RUN go get -d -v
RUN CGO_ENABLED=0 go build -o /go/bin/ghz-web

FROM alpine
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /go/bin/ghz-web /go/bin/ghz-web
COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
