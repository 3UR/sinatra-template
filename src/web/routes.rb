require_relative 'controllers/controller'
require_relative 'controllers/demo_controller'
require_relative 'controllers/error_controller'

module Routes
  def self.registered(app)

    # GET: demo
    app.get '/demo' do
      DemoController.new.demo
    end

    # ERROR HANDLING; DO NOT REMOVE IF YOU DON'T KNOW WHAT YOU'RE DOING
    app.not_found do ErrorController.new.not_found end
    app.error 500 do ErrorController.new.internal_server_error end
    app.error do ErrorController.new.internal_server_error end # unhandled error, we will just 500
    # END ERROR HANDLING
  end
end