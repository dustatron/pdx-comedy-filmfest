FROM ruby:2.5.1

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT
RUN gem install rails bundler
RUN gem install rails -v 5.2.0
RUN apt-get update -qq && apt-get install -y nodejs

ENTRYPOINT [ "/bin/bash" ]
