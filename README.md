# Sinatra App Template

This is a minimal [Sinatra](https://github.com/sinatra/sinatra) application template useful for starting a project with [Sinatra](https://github.com/sinatra/sinatra).

## Features

### Routing

Routing is simple, all routes are defined in `src/web/routes.rb` and are mapped to the controller method.

### API Support

This template was made with the intention to build micro APIs using [Sinatra](https://github.com/sinatra/sinatra). It provides a foundation that can be easily extended to add more functionality.

### Public Caching API

The global object is defined as `CACHE_STORE`. This will be the object with all the caching methods. Based on the `CACHE_ADAPTER` configuration you're using, refer to the documentation links below:

- For Redis adapter, check out the [REDIS documentation](https://api.rubyonrails.org/v7.1.2/classes/ActiveSupport/Cache/RedisCacheStore.html).
- For Memory adapter, refer to the [MEMORY documentation](https://api.rubyonrails.org/v7.1.3/classes/ActiveSupport/Cache/MemCacheStore.html).

## Usage

### Setup

#### Without Docker

> Development
1. Clone this repository.
2. Navigate to the root directory of the repository.
3. Install dependencies by running `cd src && bundle install`.
4. Run the application using `cd scripts && bash ./run_dev.sh` (on Unix-based systems) or `cd scripts && run_dev.bat` (on Windows).

> Production
1. Clone this repository.
2. Navigate to the root directory of the repository.
3. Install dependencies by running `cd src && bundle install`.
4. Install the puma gem by running `gem install puma`.
5. Run the application using `puma -c config/puma.rb`.

#### With Docker

The setup with Docker is actually pretty simple. The template includes a `docker-compose.yml` and everything needed to get the template containerized.

The basic steps can be found below, but for production, you will need to set up your own CI/CD pipeline and other configurations (Will not be included here). These steps are just to get the minimal template up and running. In your own environment, you may need to set different configurations, etc.

1. Clone this repository.
2. Navigate to the root directory of the repository.
3. Makr sure Docker is installed on your system.
4. Buld and start the container with the following command: `docker-compose up -d --build`

**NOTE:** As stated above, thsi setup is minimal and not something you should use for production deployment. Consider setting up a proper CI/CD pipeline for production deployments.

### Configuration

To configure your app, all required settings must be provided as environment variables. If any setting is not provided, the default value will be used.

#### All Settings
- **APP_HOST**: This is the host for the application (When the `RACK_ENV` is `production` the app will 403 when a request comes from a host which is not defined here such as the IP hosting the app).
- **APP_PORT**: This is the port for the application.
- **APP_CORS_ORIGIN**: This is optional if not provided `*` will be used otherwise specify origin
- **RACK_ENV**: This is the environment for the application it can be the following: `development, production` the default is development.
- **WEB_CONCURRENCY**: This is the number of worker processes that should be used.
- **MAX_THREADS**: This is the number of threads that should be used.
- **DB_ADAPTER**: This is the DB you are using it can be the following: `mysql, psql, sqlite3`. The default is `sqlite3`. **NOTE:** When using a different DB adapter make sure that you uncomment your selected provider in `src/Gemfile` and comment the default out (you may also need to update `.dockerfile`).
- **DB_NAME**: This is your application DB name.
- **DB_USERNAME**: This is the username for your application DB.
- **DB_PASSWORD**: This is the password for your application DB.
- **DB_HOST**: This is the host for your application DB.
- **DB_PORT**: This is the port for your application DB.
- **CACHE_ADAPTER**: This is the cache adapter you are using it can be the following: `memory, redis`. The default is `memory`.
- **CACHE_HOST**: This is the host for your cache server. Default is localhost. **NOTE:** This is only required if using `redis`.
- **CACHE_PORT**: This is the port for your cache server. Default is 6379. **NOTE:** This is only required if using `redis`.
- **CACHE_PASSWORD**: This is the password for your cache server. Default is empty (no password). **NOTE:** This is only required if using `redis`.
- **CACHE_EXPIRATION**: This is the expiration time for cached items in seconds. Default is 3600 seconds (1 hour).

### Creating Controllers

Creating controllers is really easy based on how you've structured the project. Here's what you need to do:

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake make:controller[controller_name_here]`.
3. You'll now find a newly created controller along with documentation inside `web/controllers/<controller_name>.rb`.

### Creating Migrations

Creating migrations is really easy based on how you've structured the project. Here's what you need to do:

**NOTE:** THIS ALSO CREATES A MODEL WITH THE SAME NAME SO NO MODEL CREATION IS NEEDED

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake make:migration[model_name_here]`.
3. You'll now find a newly created migration along with documentation inside `database/migrations/<date>_<migration_name>.rb`.

### Migrating/Other CLI Commands

Other CLI commands can be listd pretty easily. Here's what you need to do:

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake --tasks`.
3. You'll now see a list of CLI commands.

### Using Models

Make sure you have configured your database first and created all migrations after this you can do `require_relative '../models/model_name'` from your controller.

## Contributing
If you have any suggestions, features, bug fixes or enhancements, feel free to open an issue or create a pull request.
