require 'sinatra'

require_relative 'config/config'
require_relative 'web/middleware/host_filter'
require_relative 'web/routes'

# sinatra config
set :host, ENV['APP_HOST'] || 'localhost'
set :port, ENV['APP_PORT'] || 45870
set :environment, ENV['APPRACK_ENV_ENV'] || 'development'
set :debug, ENV['RACK_ENV'] == 'development'

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