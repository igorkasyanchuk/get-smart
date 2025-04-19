## 🔧 Extending Sprockets with a Custom Processor
You can write custom Sprockets processors to manipulate assets before they’re served. For instance, auto‑prepend a banner comment to every JavaScript file:

```ruby
# lib/assets/banner_processor.rb
class BannerProcessor
  def self.call(input)
    data = input[:data]
    banner = "/* Compiled at #{Time.now.utc} */\n"
    { data: banner + data }
  end
end

# config/initializers/sprockets.rb
Rails.application.config.assets.configure do |env|
  env.register_preprocessor 'application/javascript', BannerProcessor
end
```

This runs your processor on each JS asset, giving you full control over asset content at compile time.