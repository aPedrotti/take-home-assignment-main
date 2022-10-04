#FROM nginx:latest
#EXPOSE 8080
# BASE BUILD
FROM golang:1.19-bullseye as builder

WORKDIR /app

# Copy local code to the container image.
COPY . ./

# Retrieve application dependencies.
RUN go mod init dockerize
RUN go get

# Build the binary.
RUN go build -v -o myapp-web .

# RUNTIME IMAGE
FROM debian:bullseye-slim
#FROM gcr.io/distroless/base-debian10

ENV APP_NAME="myapp-web"
ENV APP_PATH=/app

RUN set -x && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy the binary to the production image from the builder stage.
COPY --from=builder /app/myapp-web /app/myapp-web
COPY ./src/ /app/src/
ADD server.confi /app/

WORKDIR $APP_PATH

# Execute with a non-root
ENV USER_NAME="${APP_NAME}"
RUN groupadd -g 1000 $USER_NAME && useradd -r -g $APP_NAME --base-dir $APP_PATH --home-dir $APP_PATH --uid 1000 $USER_NAME && usermod -aG www-data ${USER_NAME}
RUN chown -R $USER_NAME:$USER_NAME $APP_PATH

USER 1000

EXPOSE 8080

ENTRYPOINT ["/app/myapp-web"]
