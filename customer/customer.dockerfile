# use base go image
FROM golang:1.20-alpine3.17 as builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 go build -o customerService ./cmd/api/main.go

RUN chmod +x /app/customerService

# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/customerService /app

CMD [ "/app/customerService" ]
