FROM ruby:alpine

MAINTAINER Jorge Quilcate <quilcate.jorge@gmail.com>

ENV SLIDES_BASE=/opt

WORKDIR $SLIDES_BASE

RUN apk add --no-cache bash git openssh python make inotify-tools
RUN gem install asciidoctor tilt thread_safe slim
RUN git clone git://github.com/asciidoctor/asciidoctor-reveal.js.git $SLIDES_BASE

ADD Makefile .
ADD run.sh .
RUN chmod +x run.sh

VOLUME $SLIDES_BASE/slides

EXPOSE 8000

CMD ./run.sh
