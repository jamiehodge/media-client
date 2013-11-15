require "faraday"
require "yajl"

module Media
  module Client
    module Middleware

      class JSON < Faraday::Response::Middleware
        def on_complete(env)
          return unless env[:response_headers]["content-type"].to_s =~ /json/
          super
        end

        def parse(str)
          Yajl::Parser.parse(str)
        end
      end

      Faraday::Request.register_middleware json: JSON
    end
  end
end
