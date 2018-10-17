FROM ruby:2.5.1

ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get autoremove

ENV HOME=/home/app

RUN mkdir HOME

COPY . $HOME/

WORKDIR $HOME

RUN gem install bundler && \
    bundle install

EXPOSE 9292

ENTRYPOINT ["bundle", "exec"]
CMD ["puma", "--config", "config/puma.rb"]
