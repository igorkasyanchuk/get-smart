## ⚡ Fast JSON Serialization with Oj Renderer
Swap out Rails' built‑in JSON renderer for Oj to dramatically reduce rendering latency. Define a custom renderer in an initializer and leverage Oj's `mode: :compat` for near-drop‑in compatibility.

```ruby
# config/initializers/oj_renderer.rb
require 'oj'

Oj.optimize_rails

ActionController::Renderers.add :json do |obj, options|
  self.content_type ||= Mime[:json]
  options ||= {}
  json = Oj.dump(obj, mode: :compat, cache_keys: true)
  self.response_body = options[:callback] ? "#{options[:callback]}(#{json});" : json
end
```