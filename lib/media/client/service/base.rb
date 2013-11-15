require "faraday/error"

require_relative "../connection"

module Media
  module Client
    module Service
      class Base

        attr_reader :connection

        def initialize(url, connector = Connection)
          @connection = connector.new(url)
        end

        private

        class Resource

          attr_reader :connection, :namespace

          def initialize(connection, options = {})
            @connection = connection
            @namespace = options.fetch(:namespace) {
              self.class.name.split("::").last.downcase }
          end

          class << self

            def crud
              index
              create
              show
              update
              destroy
            end

            def static
              index
              show
            end

            def index
              define_method(:index) do
                request { connection.get(url) }
              end
            end

            def create
              define_method(:create) do |params = {}|
                request { connection.post(url, params) }
              end
            end

            def show
              define_method(:show) do |id|
                request { connection.get(url(id)) }
              end
            end

            def download
              define_method(:download) do |id|
                request { connection.get(url(id, "download")) }
              end
            end

            def update
              define_method(:update) do |id, params = {}|
                request { connection.put(url(id), params) }
              end
            end

            def destroy
              define_method(:destroy) do |id|
                request { connection.delete(url(id)) }
              end
            end
          end

          private

          def request
            yield
          rescue Faraday::Error::ConnectionFailed, Faraday::Error::TimeoutError
          end

          def url(*elements)
            elements.inject(namespace) {|u,e| [u,e].join("/") }
          end
        end
      end
    end
  end
end
