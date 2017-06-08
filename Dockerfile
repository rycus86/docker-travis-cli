FROM ruby

LABEL maintainer "Viktor Adam <rycus86@gmail.com>"

ARG TRAVIS_VERSION=1.8.8

RUN gem install travis -v $TRAVIS_VERSION  \
      && ruby -r $(find $BUNDLE_PATH | grep travis/tools/completion.rb) \
              -e Travis::Tools::Completion::install_completion

RUN useradd -ms /bin/bash travis-cli
USER travis-cli
ENV HOME /home/travis-cli

WORKDIR /travis

ENTRYPOINT [ "travis" ]
