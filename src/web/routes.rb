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

    # GET: /demo
    app.get '/demo' do
      AppController.new.index
    end

    # ERROR HANDLING; DO NOT REMOVE IF YOU DON'T KNOW WHAT YOU'RE DOING
    app.error 400 do ErrorController.new.bad_request end
    app.error 403 do ErrorController.new.forbidden end
    app.not_found do ErrorController.new.not_found end # TODO: read more into sinatra docs this could end up being changed to .error 404
    app.error 500 do ErrorController.new.internal_server_error end
    app.error do ErrorController.new.internal_server_error end # unhandled error, we will just 500
    # END ERROR HANDLING
  end
end