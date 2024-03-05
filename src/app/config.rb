set :host, ENV['APP_HOST'] || 'localhost'
set :port, ENV['APP_PORT'] || 45870
set :environment, ENV['APP_ENVIRONMENT'] || 'development'
set :debug, ENV['APP_ENVIRONMENT'] == 'development'