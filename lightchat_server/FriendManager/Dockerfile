FROM golang:1.18

ADD . /LightChat/FriendManager

WORKDIR /LightChat/FriendManager

#设置代理
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://goproxy.cn,direct

RUN go mod tidy

ENTRYPOINT ["go", "run", "main.go"]