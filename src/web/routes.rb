require_relative 'controllers/base_controller'
require_relative 'controllers/app_controller'
require_relative 'controllers/error_controller'

module Routes
  def self.registered(app)

    ###
    ### This is the main file where your routes are defined!
    ### To create a controller see README.md once created make sure you define the route and methods here!
    ###

    # GET: /
    app.get '/' do
      AppController.new.index
    end

    # GET: /params-demo
    app.get '/params-demo' do
      controller = AppController.new(request)
      controller.demo(params)
    end

    # GET: /cache-demo
    app.get '/cache-demo' do
      controller = AppController.new(request)
      controller.cache_demo
    end

    app.get '/rate-limiter-demo' do
      controller = AppController.new(request)
      controller.rate_limiter_demo
    end

    # ERROR HANDLING; DO NOT REMOVE IF YOU DON'T KNOW WHAT YOU'RE DOING
    app.not_found do 
      error_controller = ErrorController.new(request)
      error_controller.not_found
    end

    app.error 500 do 
      error_controller = ErrorController.new(request)
      error_controller.internal_server_error
    end

    app.error do 
      error_controller = ErrorController.new(request)
      error_controller.internal_server_error # unhandled error
    end
    # END ERROR HANDLING
  end
end