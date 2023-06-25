FROM golang:latest as builder

RUN mkdir -p /app
WORKDIR /app

COPY fc.go .

RUN go build ./fc.go

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD [ "./fc" ]