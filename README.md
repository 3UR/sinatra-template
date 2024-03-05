# Sinatra App Template

This is a minimal [Sinatra](https://github.com/sinatra/sinatra) application template useful for starting a project with [Sinatra](https://github.com/sinatra/sinatra).

## Features

### Routing

Routing is simple, all routes are defined in `src/web/routes.rb` and are mapped to the controller method.

### Flexibility and Modularity

This application template is designed for easy maintenance and seamless integration of additional features such as models, views, and more.

### API Support

This template was made for building micro APIs using [Sinatra](https://github.com/sinatra/sinatra). It provides a foundation that can be easily extended to add more functionality.

## Usage

### Setup
> Development
1. Clone this repository.
2. Install dependencies by running `cd src && bundle install`.
3. Run the application using `ruby main.rb`.

> Production **ONLY WORKS ON LINUX**
1. Clone this repository.
2. Install dependencies by running `cd src && bundle install`.
3. Install the unicorn gem by running `gem install unicorn`.
4. Run the application using `unicorn -c config/unicorn.rb`.

> **TIP:** This also comes with a `.Dockerfile` so you can dockerize your app!

## Configuration

To configure your app, all required settings must be provided as environment variables (With Docker it's as easy as using the -e flag). If any setting is not provided, the default value will be used.

### All Settings
- **APP_HOST**: This is the host for the application.
- **APP_PORT**: This is the port for the application.
- **RACK_ENV**: This is the environment for the application.
- **WEB_CONCURRENCY**: This is the number of worker processes that should be used.

## Contributing
If you have any suggestions, features, bug fixes or enhancements, feel free to open an issue or create a pull request.