
FROM ruby:3.3-alpine
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

