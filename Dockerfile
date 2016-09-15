FROM ruby:alpine

MAINTAINER Jorge Quilcate <quilcate.jorge@gmail.com>

ENV SLIDES_HOME=/opt/slides

RUN mkdir -p $SLIDES_HOME

WORKDIR $SLIDES_HOME

RUN apk add --no-cache bash git openssh python make inotify-tools

RUN gem install asciidoctor tilt thread_safe slim

RUN mkdir -p $SLIDES_HOME && \
    git clone git://github.com/asciidoctor/asciidoctor-reveal.js.git && \
    cd asciidoctor-reveal.js/test && \
    git clone -b 3.0.0 git://github.com/hakimel/reveal.js.git

WORKDIR $SLIDES_HOME/asciidoctor-reveal.js

VOLUME $SLIDES_HOME/asciidoctor-reveal.js/test

ADD Makefile .
ADD run.sh .

RUN chmod +x run.sh

CMD ./run.sh
