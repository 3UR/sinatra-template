class Config
  class General
    RACK_ENV            = ENV['RACK_ENV'] || 'development'
    APP_DEBUG           = ENV['RACK_ENV'] == 'development'
    APP_HOST            = ENV['APP_HOST'] || 'localhost'
    APP_PORT            = ENV['APP_PORT'] || 45870
    ALLOWED_CORS_ORIGIN = ENV['APP_CORS_ORIGIN'] || '*'
  end

  class Database
    ADAPTER  = ENV['DB_ADAPTER'] || 'sqlite3'
    NAME     = ENV['DB_NAME'] || 'dev_app'
    USERNAME = ENV['DB_USERNAME']
    PASSWORD = ENV['DB_PASSWORD']
    MIGRATIONS_PATH = File.expand_path('../database/migrations', __dir__)
  end

  class Caching
    ADAPTER    = ENV['CACHE_ADAPTER'] || 'memory'
    HOST       = ENV['CACHE_HOST'] || 'localhost'
    PORT       = ENV['CACHE_PORT'] || 6379
    PASSWORD   = ENV['CACHE_PASSWORD'] || '' # no password can be used with redis
    EXPIRATION = ENV['CACHE_EXPIRATION'] || 3600
  end

  #
  # Custom Configuration Classes
  #
  # You can add your own configuration classes below.
  #

end

# setup db
case Config::Database::ADAPTER
when 'mysql'
  require 'mysql2'
  ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    database: Config::Database::NAME,
    username: Config::Database::USERNAME,
    password: Config::Database::PASSWORD,
    host: ENV['DB_HOST'] || 'localhost',
    port: ENV['DB_PORT'] || 3306
  )
when 'psql'
  require 'pg'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: Config::Database::NAME,
    username: Config::Database::USERNAME,
    password: Config::Database::PASSWORD,
    host: ENV['DB_HOST'] || 'localhost',
    port: ENV['DB_PORT'] || 5432
  )
else
  require 'sqlite3'

  DB_DIRECTORY = File.expand_path('../database/data', __dir__)
  DB_FILE = File.join(DB_DIRECTORY, "#{Config::Database::NAME}.sqlite3")

  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: DB_FILE
  )
end

# setup caching
case Config::Caching::ADAPTER
when 'memory'
  require 'active_support/cache/memory_store'
  CACHE_STORE = ActiveSupport::Cache::MemoryStore.new(expires_in: Config::Caching::EXPIRATION)
when 'redis'
  require 'redis'
  require 'redis-namespace'
  require 'active_support/cache/redis_cache_store'
  
  redis_options = { url: "redis://#{Config::Caching::HOST}:#{Config::Caching::PORT}" }
  redis_options[:password] = Config::Caching::PASSWORD if Config::Caching::PASSWORD
  
  CACHE_STORE = ActiveSupport::Cache::RedisCacheStore.new(
    compress: true,
    compress_threshold: 1.kilobyte,
    expires_in: Config::Caching::EXPIRATION,
    **redis_options
  )
else
  raise "Invalid cache adapter specified: #{CACHE_ADAPTER}; Supported: memory, redis"
end