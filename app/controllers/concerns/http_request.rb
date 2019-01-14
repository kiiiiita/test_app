module HttpRequest
  extend ActiveSupport::Concern
  GET_METHOD = 'get'.freeze

  def get_contents
    res = request_uri(GET_METHOD)
    if res&.code.to_i == 200
      @contents = JSON.parse(res.body)
    else
      @errors = ["取得できませんでした"]
    end
  end

  def request_uri(http_method)
    uri = URI.parse(@uri)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    https.send(http_method, uri.request_uri)
  rescue => e

  end
end
