###
### WARNING: DO NOT DELETE THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING IT IS THE BASE FOR ALL CONTROLLERS !!!
###

class BaseController
  def response(content, status = 200, headers = {})
    [status, headers, content]
  end

  def json(data, status = 200, headers = {})
    headers['Content-Type'] = 'application/json'
    response(data.to_json, status, headers)
  end
end