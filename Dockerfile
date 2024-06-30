# Fase 1: Build
FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY main.go .

RUN go build main.go

# Fase 2: Run
FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/main .

CMD [ "./main" ]
