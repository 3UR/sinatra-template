require_relative 'controllers/base/controller'
require_relative 'controllers/demo_controller'
require_relative 'controllers/error_controller'

# when adding new routes make sure to require the controller as seen above!
# all new controllers SHOULD inherit the base controller as it ideally will have helpers etc but it is not required
# TODO: some kind of way to automate controller creation? "ruby xxx.rb create_controller {name}"

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