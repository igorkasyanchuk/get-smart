## 🚀 Mounting Rails Engines in Your Routes

When integrating a Rails engine, you need to mount it in your host app’s `config/routes.rb` so its routes become available. This centralizes the engine under a namespace and avoids path conflicts.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # Mount the BlogEngine at /blog
  mount BlogEngine::Engine, at: '/blog', as: 'blog_engine'
  
  # Other app routes
  root 'home#index'
end
```

After mounting, you can use `blog_engine.posts_path` in your views and controllers to point to the engine’s resources. The `as:` option defines the route helper prefix.