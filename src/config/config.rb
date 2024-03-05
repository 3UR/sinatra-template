# database
DB_ADAPTER = ENV['DB_ADAPTER'] || 'sqlite3'
DB_NAME = ENV['DB_NAME'] || 'dev_app'
DB_USERNAME = ENV['DB_USERNAME']
DB_PASSWORD = ENV['DB_PASSWORD']
DB_MIGRATIONS_PATH = File.expand_path('../database/migrations', __dir__)

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