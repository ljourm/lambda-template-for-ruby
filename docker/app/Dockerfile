FROM ruby:2.7.4

ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY src/Gemfile  $APP_ROOT

RUN bundle install
