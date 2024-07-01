
FROM ruby:3.3-alpine

# タイムゾーンを設定する
ENV TZ Asia/Tokyo

RUN apk update && \
    apk add --no-cache build-base mysql-dev mysql-client tzdata

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

