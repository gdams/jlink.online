FROM golang:1.14

WORKDIR /app

COPY go.mod ./
RUN go mod download

# Install source
COPY . .

# Build application
RUN go build -o main .

ENV GIN_MODE=release
ENV MAVEN_CENTRAL=false
ENV RT_CACHE=/app/runtimes
ENV TMP=/app/tmp

EXPOSE 8080

CMD ["./main"]