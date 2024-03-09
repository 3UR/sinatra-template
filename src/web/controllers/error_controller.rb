class ErrorController < BaseController
  def initialize(request, response, params)
    super(request, response, params)
  end
  
  def not_found
    json({ error: "Not Found", code: 404 }, 404)
  end

  def internal_server_error
    json({ error: "Internal Server Error", code: 500 }, 500)
  end
end