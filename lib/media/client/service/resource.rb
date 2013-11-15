require_relative "base"

module Media
  module Client
    module Service
      class Resource < Base

        def categories
          Categories.new(connection)
        end

        def collections
          Collections.new(connection)
        end

        def items
          Items.new(connection)
        end

        def languages
          Languages.new(connection)
        end

        def licenses
          Licenses.new(connection)
        end

        def resources
          Resources.new(connection)
        end

        class Categories < Base::Resource
          static
        end

        class Collections < Base::Resource
          crud
        end

        class Items < Base::Resource
          crud
        end

        class Languages < Base::Resource
          static
        end

        class Licenses < Base::Resource
          static
        end

        class Resources < Base::Resource
          crud
        end
      end
    end
  end
end
