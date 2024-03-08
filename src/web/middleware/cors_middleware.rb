class CorsMiddleware < Sinatra::Base
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    headers['Access-Control-Allow-Origin'] = "#{Config::General::ALLOWED_CORS_ORIGIN}"
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization'

    [status, headers, body]
  end
end