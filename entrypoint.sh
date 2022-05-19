# Build Fantom in a stock Go builder container
FROM golang:1.17-alpine as builder

# Install packages we need
RUN apk add --no-cache make gcc musl-dev linux-headers git

# Make a folder to work in
RUN mkdir /fantom

# Grab VERSION from Build Args
ARG VERSION

# Clone the repo to that folder
RUN git clone --branch ${VERSION} https://github.com/Fantom-foundation/go-opera.git /fantom

# Build Fantom
RUN cd /fantom && make

# Pull Fantom into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates wget tzdata
COPY --from=builder /fantom/build/opera /usr/local/bin/

# Set entrypoint
COPY ./scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
