FROM alpine:3.7

MAINTAINER "Sebastian Svensson <ss@tinbox.nu>"

ADD bin/* /usr/bin/

RUN mkdir /root/.kube
COPY config /root/.kube/config
