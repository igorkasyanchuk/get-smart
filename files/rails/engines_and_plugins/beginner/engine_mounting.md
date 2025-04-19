## 🗺️ Mount Your Engine in the Host App

After building your engine, you need to tell the host application where to serve it. Open the main app’s `config/routes.rb` and use `mount` to map a path to your engine’s routes.

```ruby
# config/routes.rb
t Rails.application.routes.draw do
  mount BlogEngine::Engine, at: "/blog"
end
```   

Visiting `http://localhost:3000/blog` will now route requests into your engine’s controllers and views.