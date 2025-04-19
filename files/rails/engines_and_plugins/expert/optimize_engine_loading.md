## 🚀 Optimize Engine Load Paths and Eager Load Strategy
Engines can slow boot times if paths aren’t pruned or eager loading unmanaged. Use `config.autoload_once_paths` and `eager_load_paths` in your engine to fine-tune load behavior, and defer heavy modules until runtime.

```ruby
# lib/my_engine/engine.rb
module MyEngine
  class Engine < ::Rails::Engine
    isolate_namespace MyEngine

    # Only eager load core API, defer utilities
    config.eager_load_paths += %W(
      #{root}/app/models/my_engine/core
    )
    config.autoload_once_paths += %W(
      #{root}/app/lib/my_engine/utils
    )

    # Lazy-load admin dashboard only on demand
    initializer "my_engine.lazy_load_admin" do
      ActiveSupport.on_load(:action_controller) do
        require_dependency MyEngine::Engine.root.join('app/controllers/my_engine/admin/dashboard_controller.rb')
      end
    end
  end
end
```

By explicitly managing these paths, you reduce memory footprint and speed up both development reloads and production boots.