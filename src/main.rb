require 'sinatra'
require 'active_record'

require_relative 'config/config'
require_relative 'web/middleware/host_filter'
require_relative 'web/routes'

# sinatra config
set :host, APP_HOST
set :port, APP_PORT
set :environment, RACK_ENV
set :debug, APP_DEBUG

# apply middleware
use HostFilter

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