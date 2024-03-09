# Sinatra App Template

This is a minimal [Sinatra](https://github.com/sinatra/sinatra) application template useful for starting a project with [Sinatra](https://github.com/sinatra/sinatra).

## Features

### Routing

Routing is simple, all routes are defined in `src/web/routes.rb` and are mapped to the controller method.

### Flexibility and Modularity

This application template is designed for easy maintenance and seamless integration of additional features such as models, views, and more.

### API Support

This template was made for building micro APIs using [Sinatra](https://github.com/sinatra/sinatra). It provides a foundation that can be easily extended to add more functionality.

### Public Caching API

#### Memory Cache

##### `read(key)`

Retrieves a cached value by its key.

Parameters:
- `key` (String): The key of the cached value to retrieve.

Returns:
- The cached value associated with the provided key, or `nil` if the key is not found.

##### `write(key, value, options = {})`

Writes a value to the cache with the specified key.

Parameters:
- `key` (String): The key under which to store the value.
- `value` (Object): The value to be cached.
- `options` (Hash, optional): Additional options for caching (e.g., expiration time).

Returns:
- The cached value.

##### `delete(key)`

Deletes a cached value by its key.

Parameters:
- `key` (String): The key of the cached value to delete.

Returns:
- `true` if the value was successfully deleted, `false` otherwise.

#### Redis Cache

##### `read(key)`

Retrieves a cached value by its key.

Parameters:
- `key` (String): The key of the cached value to retrieve.

Returns:
- The cached value associated with the provided key, or `nil` if the key is not found.

##### `write(key, value, options = {})`

Writes a value to the cache with the specified key.

Parameters:
- `key` (String): The key under which to store the value.
- `value` (Object): The value to be cached.
- `options` (Hash, optional): Additional options for caching (e.g., expiration time).

Returns:
- The cached value.

##### `delete(key)`

Deletes a cached value by its key.

Parameters:
- `key` (String): The key of the cached value to delete.

Returns:
- `true` if the value was successfully deleted, `false` otherwise.

#### Usage Examples

##### Memory Cache

```ruby
# Read from cache
cached_value = CACHE_STORE.read('my_key')

# Write to cache
CACHE_STORE.write('my_key', 'my_value')

# Delete from cache
CACHE_STORE.delete('my_key')
```

##### Redis Cache

```ruby
# Read from cache
cached_value = CACHE_STORE.read('my_key')

# Write to cache
CACHE_STORE.write('my_key', 'my_value')

# Delete from cache
CACHE_STORE.delete('my_key')
```

## Usage

### Setup
> Development
1. Clone this repository.
2. Install dependencies by running `cd src && bundle install`.
3. Run the application using `cd scripts && bash ./run_dev.sh` or on Windows `cd scripts && run_dev.bat`.

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
- **APP_CORS_ORIGIN**: This is optional if not provided `*` will be used otherwise specify origin
- **RACK_ENV**: This is the environment for the application.
- **WEB_CONCURRENCY**: This is the number of worker processes that should be used.
- **MAX_THREADS**: This is the number of threads that should be used.
- **DB_ADAPTER**: This is the DB you are using it can be the following: `mysql, psql, sqlite3`. The default is sqlite3 if this is changed make sure to update the gemfile. **NOTE:** When using a different DB adapter make sure that you uncomment your selected provider in `src/Gemfile`.
- **DB_NAME**: This is your application DB name.
- **DB_USERNAME**: This is the username for your application DB.
- **DB_PASSWORD**: This is the password for your application DB.
- **DB_HOST**: This is the host for your application DB.
- **DB_PORT**: This is the port for your application DB.
- **CACHE_ADAPTER**: This is the cache adapter you are using it can be the following: `memory, redis`. The default is memory.
- **CACHE_HOST**: This is the host for your cache server. Default is localhost.
- **CACHE_PORT**: This is the port for your cache server. Default is 6379.
- **CACHE_PASSWORD**: This is the password for your cache server. Default is empty (no password).
- **CACHE_EXPIRATION**: This is the expiration time for cached items in seconds. Default is 3600 seconds (1 hour).

### Creating Controllers

Creating controllers is really easy based on how you've structured the project. Here's what you need to do:

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake make:controller[name]`.
3. You'll now find a newly created controller along with documentation inside `web/controllers/<controller_name>.rb`.

### Creating Migrations

Creating migrations is really easy based on how you've structured the project. Here's what you need to do:

**NOTE:** THIS ALSO CREATES A MODEL WITH THE SAME NAME SO NO MANUAL MODEL CREATION IS NEEDED

1. Navigate to the root directory containing the `Rakefile`.
2. Run the following command in your terminal: `rake make:migration[name]`.
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
