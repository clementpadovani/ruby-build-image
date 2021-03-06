ARG RUBY_VERSION=2.7.1

FROM ruby:${RUBY_VERSION}-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git \
                       "ruby-full~=${RUBY_VERSION}" \
                       ruby-bundler \
                       curl \
                       g++ \
                       make \
                       zlib-dev \
                       openssh \
                       bash

# You cannot run CocoaPods as root
RUN adduser -D cocoapods
USER cocoapods

# Disable stat sending on our CI machines
ENV COCOAPODS_DISABLE_STATS='TRUE'
