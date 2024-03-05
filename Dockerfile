FROM ruby:3.3.0-alpine

WORKDIR /sinatra-app

# Install dependencies
RUN apk --no-cache add build-base tzdata

# Install gems
COPY src/Gemfile ./
RUN bundle install
RUN gem install puma

# Copy application
COPY src .

CMD ["puma", "-C", "config/puma.rb"]