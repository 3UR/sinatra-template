class ErrorController < BaseController  
  def bad_request
    json({ error: "Bad Request", code: 400 }, 400)
  end

  def forbidden
    json({ error: "Forbidden", code: 403 }, 403)
  end

  def not_found
    json({ error: "Not Found", code: 404 }, 404)
  end

  def internal_server_error
    json({ error: "Internal Server Error", code: 500 }, 500)
  end
end