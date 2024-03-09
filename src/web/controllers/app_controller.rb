class AppController < BaseController
  def initialize(request, response, params)
    super(request, response, params)
  end

  # Hooray! Your controller has been created. To get started, you can:
  #  - Define controller actions to handle different routes and requests.
  #  - Use helper methods provided in the base controller (see web/controller/base_controller.rb).
  #  - Utilize built-in Sinatra helpers, or register your own custom helpers (see Sinatra documentation).
  #
  # Here are some tips:
  #  - Make sure that your controllers are mapped to a route (see web/routes.rb).
  #  - Make sure that you handle errors within controller actions correctly, as the global handler may not catch all errors and or your app may crash/degrade.
  #  - Have fun with this Template/Library whatever you consider it!
  
  # Here is an example action to get you going:
  def index
    json({ message: "Hello World!" })
  end

  # This is moved from `demo_controller` because I want the Sinatra template to have an example controller with the documentation from generate_controller
  def demo(params)
    word = params[:word]

    # taken from the sinatra lib documentation and changed up to work with my template
    json({ message: "I'm a teapot!", word: word }, 418, { "Allow" => "BREW, POST, GET, PROPFIND, WHEN", "Refresh" => "Refresh: 20; https://ietf.org/rfc/rfc2324.txt" })
  end

  # Action for framework user to try out the public cacing API
  def cache_demo
    # check if the value is cached
    cached_value = CACHE_STORE.read('cache_demo_cached_data')

    if cached_value.nil?
      # no data is cached, we can generate data to cache and then cache it
      data = generate_data_to_cache
      CACHE_STORE.write('cache_demo_cached_data', data, expires_in: Config::Caching::EXPIRATION)
    else
      # data is cached
      data = cached_value
    end

    json({ data: data })
  end

  def rate_limiter_demo
    # 5 requests within 20 seconds
    key = "testing_rate_limiter:#{visitor_ip}"
    limit = 5
    interval = 20
    return rate_limit(key, limit, interval) if rate_limit(key, limit, interval)
  
    return json({ "message" => key })
  end

  private

  def generate_data_to_cache
    "This is cached data generated at #{Time.now.utc}"
  end
end