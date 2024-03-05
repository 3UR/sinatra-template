require 'sinatra'
require 'dotenv/load'

require_relative 'app/config'
require_relative 'web/routes'

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