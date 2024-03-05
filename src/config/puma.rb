workers Integer(ENV['WEB_CONCURRENCY'] || 4)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

port        ENV['APP_PORT'] || 45870
environment ENV['RACK_ENV'] || 'development'