ARG RUBY_VERSION=2.7.1

FROM ruby:${RUBY_VERSION}-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git "ruby-full~=${RUBY_VERSION}" ruby-dev ruby-bundler curl g++ make zlib-dev