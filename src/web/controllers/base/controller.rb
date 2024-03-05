# base controller inherited by other controllers
class Controller
  def response(content, status = 200, headers = {})
    [status, headers, content]
  end

  def json(data, status = 200, headers = {})
    headers['Content-Type'] = 'application/json'
    response(data.to_json, status, headers)
  end
end