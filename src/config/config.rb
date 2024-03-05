set :host, ENV['APP_HOST'] || 'localhost'
set :port, ENV['APP_PORT'] || 45870
set :environment, ENV['APPRACK_ENV_ENV'] || 'development'
set :debug, ENV['RACK_ENV'] == 'development'