# Debian flavor DockerFile to pull Upstream Nodejs, NPM
FROM debian:jessie

RUN apt-get update && apt-get install -y \
        nano \
		ca-certificates \
		curl
# Import public gpg keys from "Timothy J Fontaine (Work) <tj.fontaine@joyent.com>" 
RUN curl -SLk "https://hkps.pool.sks-keyservers.net/pks/lookup?op=get&search=0x0246406D" | gpg --import

ENV NODE_VERSION 0.12.2
ENV NPM_VERSION 2.5.1

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
	&& curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
	&& gpg --verify SHASUMS256.txt.asc \
	&& grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
	&& tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
	&& npm install -g npm@"$NPM_VERSION" \
	&& npm cache clear

ENTRYPOINT ["node"]