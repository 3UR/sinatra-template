class HostFilter < Sinatra::Base
  def initialize(app)
    @app = app
  end

  def call(env)
    unless Rack::Request.new(env).host == ENV['APP_HOST']
      #halt 403 - wish i could just use halt but it wont work? if anyone sees this and wants to explain why or pr please do
      return [403, {}, []]
    end

    @app.call(env)
  end
end