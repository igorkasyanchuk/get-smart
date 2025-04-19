## ⚙️ Using Initializers to Configure Plugins and Engines

Engines often provide configuration options via initializer blocks. Place a file in `config/initializers` of your host app to set these options at boot time.

```ruby
# config/initializers/blog_engine.rb
BlogEngine.setup do |config|
  # Change the default posts_per_page
  config.posts_per_page = 10
  # Enable custom author badge
  config.show_author_badge = true
end
```

Consult the engine’s README for available settings. Adjusting them here helps you tailor engine behavior without monkey-patching.