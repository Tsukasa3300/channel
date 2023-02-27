FROM ruby:3.1.3
RUN apt-get update && apt-get install -y nodejs npm graphviz

WORKDIR /ch

COPY Gemfile Gemfile.lock ./
RUN bundle
COPY . .