FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main ./cmd/main.go

FROM alpine:latest

# Copy the binary from the builder stage
COPY --from=builder /app/main /main

EXPOSE 8080

CMD ["/main"]
