#==============================================================================
FROM golang:alpine as builder


RUN apk --no-cache add make gcc git

WORKDIR /go/src/github.com/go-graphite

ARG GIT_REF

ENV GIT_REPO=https://github.com/go-graphite/carbonapi.git
ENV GIT_TAGw=${GIT_REF:-master}


RUN git clone ${GIT_REPO} && \
    cd carbonapi && \
    git checkout ${GIT_TAG}

WORKDIR /go/src/github.com/go-graphite/carbonapi
COPY . .

RUN  pwd && ls -lha
RUN  CGO_ENABLED=0 make nocairo carbonzipper
#==============================================================================

#==============================================================================
FROM alpine:latest

RUN apk --no-cache add ca-certificates bash
WORKDIR /

COPY --from=builder /go/src/github.com/go-graphite/carbonapi/carbonapi ./usr/bin/carbonapi

CMD ["carbonapi", "-config", "/etc/carbonapi/carbonapi.yaml"]
#==============================================================================
