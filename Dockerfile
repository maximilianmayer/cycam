FROM ruby:2.4-alpine3.7
LABEL Maintainer="Maximilian Mayer <mayer.maximilian@gmail.com>"
LABEL version="0.1.2"
LABEL description="Dockerfile for CyCAM application"


COPY app.rb /opt/cycam/
COPY config.ru /opt/cycam/
COPY docker-puma.rb /opt/cycam/
COPY config.yaml /opt/cycam/
COPY Gemfile /opt/cycam/
COPY views/ /opt/cycam/
#COPY static/ /opt/cycam/

WORKDIR /opt/cycam

RUN apk add --update build-base && \
		bundle install && \
		apk del build-base && \
		rm -rf /var/cache/apk/*

ENTRYPOINT ["puma", "-C", "docker-puma.rb"]

