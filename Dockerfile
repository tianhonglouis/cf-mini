# Cloud Foundry core stack
# version 0.1
FROM ubuntu:12.04.5
MAINTAINER Tommy Hughes <tchughesiv@gmail.com>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get -yq install curl dnsmasq-base
RUN sed -i 's/^mesg n/tty -s \&\& mesg n/g' /root/.profile
ADD ./README.md ~/
ENV INSTALLER_BRANCH=v205
ENV NISE_DOMAIN=cf.mini
ENV NISE_PASSWORD=c1oudc0w
RUN bash < <(curl -s -k -B https://raw.githubusercontent.com/yudai/cf_nise_installer/${INSTALLER_BRANCH}/scripts/bootstrap.sh)

RUN rm -rf /var/lib/apt/lists/*