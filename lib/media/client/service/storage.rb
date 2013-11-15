require_relative "base"

module Media
  module Client
    module Service
      class Storage < Base

        def directories
          Directories.new(connection)
        end

        def files
          Files.new(connection)
        end

        class Directories < Base::Resource
          crud
        end

        class Files < Base::Resource
          crud
          download
        end
      end
    end
  end
end
