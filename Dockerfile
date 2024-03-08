FROM ruby:3.3.0-alpine

WORKDIR /sinatra-app

# Install dependencies
RUN apk --no-cache add build-base tzdata mariadb-dev postgresql-dev

# Install gems
COPY src/Gemfile ./
RUN bundle install

# Copy application
COPY src .

CMD ["puma", "-C", "config/puma.rb"]
