FROM ruby:3.3.0-alpine

WORKDIR /sinatra-api

# https://stackoverflow.com/questions/58071977/error-loading-shared-library-libsqlite3-so-0-in-docker-container
#RUN apk --no-cache add sqlite-libs ; WHY DOESNT SQLITE WORKKKKKKKK

# Install dependencies
RUN apk --no-cache add build-base tzdata mariadb-dev postgresql-dev sqlite-dev

# Install gems
COPY src/Gemfile ./
RUN bundle install

# Copy application
COPY src .

CMD ["puma", "-C", "config/puma.rb"]