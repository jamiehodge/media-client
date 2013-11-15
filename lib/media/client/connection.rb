require "delegate"
require "faraday"

require_relative "middleware"

module Media
  module Client
    class Connection < SimpleDelegator

      def initialize(url, client = Faraday)
        super(client.new(url) {|c|
          c.request :multipart
          c.request :url_encoded
          c.request :retry
          c.request :json

          c.adapter :net_http
          })
      end
    end
  end
end
