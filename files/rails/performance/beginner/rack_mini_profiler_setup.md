## 🕵️‍♂️ Profile with rack-mini-profiler
Identify slow queries and view render times with `rack-mini-profiler`. It overlays a performance panel in your app, helping you spot bottlenecks quickly.

```ruby
# Gemfile
gem 'rack-mini-profiler', require: false

# config/initializers/mini_profiler.rb
if Rails.env.development?
  require 'rack-mini-profiler'
  Rack::MiniProfilerRails.initialize!(Rails.application)
end
```