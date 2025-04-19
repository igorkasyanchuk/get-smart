## 🧩 Leverage isolate_namespace for Safe Engine Integration

By isolating your engine's namespace, you prevent class name collisions and ensure a clean separation of concerns between the host app and your engine. You can also share configuration defaults via `Engine` subclasses to DRY up common settings.

```ruby
# lib/my_engine/engine.rb
module MyEngine
  class Engine < ::Rails::Engine
    isolate_namespace MyEngine

    # Define custom config options
    config.my_engine = ActiveSupport::OrderedOptions.new
    config.my_engine.api_endpoint = 'https://api.example.com'

    initializer 'my_engine.setup' do |app|
      MyEngine.setup do |cfg|
        cfg.api_endpoint = app.config.my_engine.api_endpoint
      end
    end
  end
end
```

This sets up a namespaced engine and injects host app configs into your engine initializer for greater flexibility.