## 📊 CPU Profiling with StackProf in Production

StackProf is a sampling profiler that safely runs in production to pinpoint CPU bottlenecks. Wrap your code or middleware in `StackProf.run` and analyze the output offline to optimize hot paths.

```ruby
# config/initializers/stackprof.rb
if Rails.env.production?
  Rails.application.middleware.use(Rack::Builder.new do
    use Rack::Runtime
    run lambda { |env|
      result = StackProf.run(mode: :wall, out: 'tmp/stackprof.dump', interval: 1000) do
        @app.call(env)
      end
      result
    }
  end)
end
```

```bash
stackprof tmp/stackprof.dump --text
```