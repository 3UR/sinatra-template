class TestController < Controller
  def test
    # taken from the sinatra lib documentation and changed up to work with my template
    json({ message: "I'm a teapot!" }, 418, { "Allow" => "BREW, POST, GET, PROPFIND, WHEN", "Refresh" => "Refresh: 20; https://ietf.org/rfc/rfc2324.txt" })
  end
end