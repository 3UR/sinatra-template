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
3. Install the puma gem by running `gem install puma`.
4. Run the application using `puma -c config/puma.rb`.

> **TIP:** This also comes with a `.Dockerfile` so you can dockerize your app!

### Configuration

To configure your app, all required settings must be provided as environment variables (With Docker it's as easy as using the -e flag). If any setting is not provided, the default value will be used.

#### All Settings
- **APP_HOST**: This is the host for the application.
- **APP_PORT**: This is the port for the application.
- **RACK_ENV**: This is the environment for the application.
- **WEB_CONCURRENCY**: This is the number of worker processes that should be used.
- **MAX_THREADS**: This is the number of threads that should be used.
- **DB_ADAPTER**: This is the DB you are using it can be the following: `mysql, psql, sqlite3`. The default is sqlite3 if this is changed make sure to update the gemfile 
- **DB_NAME**: This is your application DB name.
- **DB_USERNAME**: This is the username for your application DB.
- **DB_PASSWORD**: This is the password for your application DB.
- **DB_HOST**: This is the host for your application DB.
- **DB_PORT**: This is the port for your application DB.

### Creating Controllers

Creating controllers is really easy based on how you've structured the project. Here's what you need to do:

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake make:controller[name]`.
3. You'll now find a newly created controller along with documentation inside `web/controllers/<controller_name>.rb`.

### Creating Migrations

Creating migrations is really easy based on how you've structured the project. Here's what you need to do:

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake make:migration[name]`.
3. You'll now find a newly created migration along with documentation inside `database/migrations/<date>_<migration_name>.rb`.

### Migrating/Other CLI Commands

Other CLI commands can be listd pretty easily. Here's what you need to do:

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake --tasks`.
3. You'll now see a list of CLI commands.

## Contributing
If you have any suggestions, features, bug fixes or enhancements, feel free to open an issue or create a pull request.