## 📂 Dynamic Versioned Autoload Paths
Keep your versioned code DRY by dynamically adding versioned modules to Rails’ autoload paths. This eliminates manual `require_dependency` calls and leverages Zeitwerk for isolating controllers, serializers, and even service objects under `app/api/vX`. 

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'api', 'v*')]
    config.eager_load_paths += config.autoload_paths
  end
end
```

Then structure your directory:

```
app/api/v1/posts_controller.rb
app/api/v2/posts_controller.rb
app/api/v2/serializers/post_serializer.rb
```
