FROM alpine
LABEL maintainer Naba Das <hello@get-deck.com>

ENV GOPATH "/root/go"
ENV MAIL_STORAGE="memory" \
    MAIL_SMTP_PORT="1025" \
    MAIL_API_PORT="8025" \
    MAIL_HOSTNAME="mailhog.dev"

RUN apk add build-base go git openrc curl && \
    mkdir -p ${GOPATH} && \
    go get github.com/mailhog/MailHog && \
    mv ${GOPATH}/bin/MailHog /usr/local/bin/mailhog && \
    rm -rf ${GOPATH}

RUN apk add --update --no-cache bash ca-certificates curl openssl shadow vim

# copy root filesystem
COPY rootfs /

# external
EXPOSE 1025 8025
WORKDIR /src

RUN chmod +x /etc/services.d/mailhog/run
RUN chmod +x /etc/services.d/mailhog/finish

ENTRYPOINT ["mailhog"]