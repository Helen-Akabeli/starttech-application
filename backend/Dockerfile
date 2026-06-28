FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o starttech ./cmd/api

FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/starttech .
EXPOSE 8080
CMD ["./starttech"]
