class HostFilter < Sinatra::Base
  def initialize(app)
    @app = app
  end

  def call(env)
    host = Rack::Request.new(env).host
    unless host == Config::General::APP_HOST
      puts "Reject host '#{host}' because it is not allowed (#{Config::General::APP_HOST})"
      return [403, {}, []]
    end

    @app.call(env)
  end
end