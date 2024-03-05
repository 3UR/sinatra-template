class HostFilter < Sinatra::Base
  def initialize(app)
    @app = app
  end

  def call(env)
    host = Rack::Request.new(env).host
    unless host == Config::General::APP_HOST
      #halt 403 - wish i could just use halt but it wont work? if anyone sees this and wants to explain why or pr please do
      puts "Reject host '#{host}' because it is not allowed (#{Config::General::APP_HOST})"
      return [403, {}, []]
    end

    @app.call(env)
  end
end