from golang:1.17 as golang

WORKDIR /go/src/desafio_docker

COPY main.go .

RUN go mod init desafio_docker
RUN go build -o app


FROM scratch

COPY --from=golang /go/src/desafio_docker/app .

ENTRYPOINT ["./app"]