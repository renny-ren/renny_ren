class HandleBadEncodingMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      Rack::Utils.parse_nested_query(env["QUERY_STRING"].to_s)
    rescue Rack::Utils::InvalidParameterError
      params = URI.decode_www_form(env["QUERY_STRING"])
      query_string = URI.encode_www_form(params)
      env["QUERY_STRING"] = query_string
    end

    @app.call(env)
  end
end
