## 🧲 Use `on_load` Hooks for Late Engine Configuration
ActiveSupport’s `on_load` hooks let you configure Rails components after they load. This is crucial in engines to avoid load order issues and monkey-patching core modules prematurely.

```ruby
ActiveSupport.on_load(:action_controller) do
  include MyEngine::ControllerExtensions
  wrap_parameters format: [:json]
end

ActiveSupport.on_load(:active_record) do
  include MyEngine::RecordValidations
end
```

Hooks guarantee your customizations run at the correct lifecycle phase, decoupling from explicit initializers.