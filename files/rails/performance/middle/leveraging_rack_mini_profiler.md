## 🔍 Leverage Rack Mini Profiler

Quickly identify slow controller actions and view partials in development. It displays query times and stack traces inline.

```ruby
# Gemfile (development)
gem "rack-mini-profiler"

# config/initializers/mini_profiler.rb
if Rails.env.development?
  Rack::MiniProfiler.config.position = 'bottom-right'
end
```
