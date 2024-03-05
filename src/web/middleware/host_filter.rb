class HostFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    unless Rack::Request.new(env).host == ENV['APP_HOST']
      return [403, { 'Content-Type' => 'application/json' }, [{ error: 'Forbidden' }.to_json]]
    end

    @app.call(env)
  end
end