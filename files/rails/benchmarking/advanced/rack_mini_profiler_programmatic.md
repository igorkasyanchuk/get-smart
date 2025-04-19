## 🔍 Programmatic Rack::MiniProfiler Benchmarking
Use `Rack::MiniProfiler` programmatically to benchmark full request cycles and capture flamegraphs. This lets you embed profiling in integration tests or scripts without manual web interaction.

```ruby
# script/bench_profile.rb
require_relative '../config/environment'
require 'rack-mini-profiler'

Rack::MiniProfiler.authorize_request
app = Rails.application
env = Rack::MockRequest.env_for('/posts?include_comments=true')

# Enable profiler
env['rack-mini-profiler-authorize'] = '1'

status, headers, body = app.call(env)
html = body.join

# Extract the profiler script and timings
data = html.match(/MiniProfiler.+?settings:
(\{.*?\}),/m)[1]
puts JSON.parse(data)
```