FROM alpine:latest

ENV JAVA_HOME /opt/java

ADD downloads/jdk-8*.tar.gz /opt/

RUN adduser -D -g '' -s /sbin/nologin user && \
	ln -s /opt/jdk* ${JAVA_HOME} && \
	ln -s ${JAVA_HOME}/bin/java /usr/local/bin/java
	
WORKDIR /tmp
	
RUN apk add --no-cache ca-certificates tar openssl libgcc wget

RUN	wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-bin-2.28-r0.apk && \
	apk add glibc-2.28-r0.apk glibc-bin-2.28-r0.apk
  
ENTRYPOINT [ "/bin/sh" ]
