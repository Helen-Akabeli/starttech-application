FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o starttech ./cmd/api
FROM ubuntu:22.04
WORKDIR /app
COPY --from=builder /app/starttech .
EXPOSE 8080
CMD ["./starttech"]
