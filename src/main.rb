require 'sinatra'
require 'active_record'

# configuration
require_relative 'config/config'

# middleware
require_relative 'web/middleware/host_filter'
require_relative 'web/middleware/cors_middleware'

# routes
require_relative 'web/routes'

# ratelimiter (required here so it can be used globally)
require_relative 'lib/rate_limiter'

# sinatra config
set :host, Config::General::APP_HOST
set :port, Config::General::APP_PORT
set :environment, Config::General::RACK_ENV
set :debug, Config::General::APP_DEBUG

# apply middleware
if not Config::General::APP_DEBUG
  use HostFilter
end
use CorsMiddleware

# register routes
register Routes

# no signals on windows (consider win development env anyways)
if RbConfig::CONFIG['host_os'] !~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  trap('SIGINT') do
    puts 'GOT SIGINT...'
    exit!
  end

  trap('SIGUSR1') do
    puts 'GOT SIGUSR1...'
    exec($PROGRAM_NAME, *ARGV)
  end
end