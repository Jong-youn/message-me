FROM ruby:2.5.1

RUN apt-get update &&\
    apt-get -qq -y install git curl build-essential nodejs

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

ENV RAILS_ENV production

COPY . .

EXPOSE 3000
CMD ["rails s"]