# Aplicação GO com imagem docker reduzida

Estes arquivos demonstram como criar uma imagem docker para execução de uma aplicação go. Utiliza o multi-stage build para reduzir o tamanho da imagem

```dockerfile
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
```
na primeira fase ele compila o arquivo GO, na segunda ele executa.
