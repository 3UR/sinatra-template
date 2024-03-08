###
### WARNING: DO NOT DELETE THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING IT IS THE BASE FOR ALL CONTROLLERS !!!
###

class BaseController
  def initialize(request)
    @request = request
  end

  def response(content, status = 200, headers = {})
    [status, headers, content]
  end

  def json(data, status = 200, headers = {})
    headers['Content-Type'] = 'application/json'
    response(data.to_json, status, headers)
  end

  def absolute_url(path)
    "#{@request.base_url}#{path}"
  end
  
  def rate_limit(key, limit, interval)
    return json({ "error" => "Rate limit exceeded" }, 429) if RateLimiter.is_exceeded?(key, limit, interval)
  end

  def visitor_ip
    @request.env['HTTP_CF_CONNECTING_IP'] || @request.ip
  end
end