require_relative 'controllers/base/controller'
require_relative 'controllers/test_controller'

# when adding new routes make sure to require the controller as seen above!
# all new controllers SHOULD inherit the base controller as it ideally will have helpers etc but it is not required
# TODO: some kind of way to automate controller creation? "ruby xxx.rb create_controller {name}"

module Routes
  def self.registered(app)

    # GET: test
    app.get '/test' do
      TestController.new.test
    end

  end
end