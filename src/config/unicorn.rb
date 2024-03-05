worker_processes Integer(ENV['WEB_CONCURRENCY'] || 2)
listen ENV['APP_PORT'] || 45870
env = ENV['RACK_ENV'] || 'development'