# TODO: Class?

# general configuration
RACK_ENV  = ENV['RACK_ENV'] || 'development'
APP_DEBUG = ENV['RACK_ENV'] == 'development'
APP_HOST  = ENV['APP_HOST'] || 'localhost'
APP_PORT  = ENV['APP_PORT'] || 45870

# database configuration
DB_ADAPTER  = ENV['DB_ADAPTER'] || 'sqlite3'
DB_NAME     = ENV['DB_NAME'] || 'dev_app'
DB_USERNAME = ENV['DB_USERNAME']
DB_PASSWORD = ENV['DB_PASSWORD']
DB_MIGRATIONS_PATH = File.expand_path('../database/migrations', __dir__)

# cache configuration
CACHE_ADAPTER    = ENV['CACHE_ADAPTER'] || 'memory'
CACHE_HOST       = ENV['CACHE_HOST'] || 'localhost'
CACHE_PORT       = ENV['CACHE_PORT'] || 6379
CACHE_PASSWORD   = ENV['CACHE_PASSWORD'] || '' # no password can be used with redis
CACHE_EXPIRATION = ENV['CACHE_EXPIRATION'] || 3600

# configure db based on the adapter used
case DB_ADAPTER
when 'mysql'
  require 'mysql2'
  ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    database: DB_NAME,
    username: DB_USERNAME,
    password: DB_PASSWORD,
    host: ENV['DB_HOST'] || 'localhost',
    port: ENV['DB_PORT'] || 3306
  )
when 'psql'
  require 'pg'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: DB_NAME,
    username: DB_USERNAME,
    password: DB_PASSWORD,
    host: ENV['DB_HOST'] || 'localhost',
    port: ENV['DB_PORT'] || 5432
  )
else
  require 'sqlite3'

  DB_DIRECTORY = File.expand_path('../database/data', __dir__)
  DB_FILE = File.join(DB_DIRECTORY, "#{DB_NAME}.sqlite3")

  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: DB_FILE
  )
end

# configure caching based on the adpater used
case CACHE_ADAPTER
when 'memory'
  require 'active_support/cache/memory_store'
  CACHE_STORE = ActiveSupport::Cache::MemoryStore.new(expires_in: CACHE_EXPIRATION)
when 'redis'
  require 'redis'
  require 'redis-namespace'
  require 'active_support/cache/redis_cache_store'
  
  redis_options = { host: CACHE_HOST, port: CACHE_PORT }
  redis_options[:password] = CACHE_PASSWORD if CACHE_PASSWORD
  
  redis = Redis.new(redis_options)
  CACHE_STORE = ActiveSupport::Cache::RedisCacheStore.new(redis, expires_in: CACHE_EXPIRATION)
else
  raise "Invalid cache adapter specified: #{CACHE_ADAPTER}; Supported: memory, redis"
end