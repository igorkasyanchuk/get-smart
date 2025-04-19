## ⚙️ Extend Rails Generators with Plugin Hooks

Create custom generators inside your plugin to scaffold boilerplate code for consumers. Use `hook_for` and `remove_file` to integrate or override existing Rails generators, giving users a seamless setup experience.

```ruby
# lib/generators/my_plugin/install_generator.rb
module MyPlugin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      desc 'Installs MyPlugin initializer and migrations'

      # Copy initializer template
      def copy_initializer
        template 'my_plugin.rb', 'config/initializers/my_plugin.rb'
      end

      # Hook into ActiveRecord's migration generator
      hook_for :orm, required: false

      # Optionally remove unwanted files
      def remove_unneeded
        remove_file 'app/assets/stylesheets/application.css'
      end
    end
  end
end
```

Users can run `rails generate my_plugin:install` to auto-wire all necessary components while leveraging built-in Rails hooks.