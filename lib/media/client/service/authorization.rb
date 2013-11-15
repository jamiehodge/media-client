require_relative "base"

module Media
  module Client
    module Service
      class Authorization < Base

        def authorizations
          Authorizations.new(connection)
        end

        class Authorizations < Base::Resource
          index
          create
          show
          destroy
        end
      end
    end
  end
end
