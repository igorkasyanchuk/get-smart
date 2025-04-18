require "rails/generators"

module Get
  module Smart
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path("templates", __dir__)
        desc "Creates a Get::Smart initializer file at config/initializers/get_smart.rb"

        def copy_initializer
          template "get_smart.rb", "config/initializers/get_smart.rb"
        end
      end
    end
  end
end
