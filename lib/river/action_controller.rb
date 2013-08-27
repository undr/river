module River
  module ActionController
    def stream_json_in_batches scope, options = {}
      self.response.headers["Cache-Control"] ||= "no-cache"
      self.response.headers["Transfer-Encoding"] = "chunked" if options[:chunked]
      self.response.headers['Last-Modified'] = Time.now.to_s
      self.response.headers['Content-Type'] = Mime::JSON
      self.response.headers.delete('Content-Length')
      self.response_body = Streamer.new(scope, options)
    end
  end
end
