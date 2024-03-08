class ErrorController < BaseController
  #keepme
  def initialize(request)
    super(request)
  end
  
  def not_found
    json({ error: "Not Found", code: 404 }, 404)
  end

  def internal_server_error
    json({ error: "Internal Server Error", code: 500 }, 500)
  end
end