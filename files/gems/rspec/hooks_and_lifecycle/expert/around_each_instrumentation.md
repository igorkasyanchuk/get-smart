## 🔄 Advanced Around Hook Instrumentation

Use around(:each) to wrap example execution with custom instrumentation and guaranteed cleanup. This is ideal for timing, tracing, or managing external resources without polluting your example code. Leverage Ruby’s `ensure` block to always perform teardown, even if an error is raised.

```ruby
RSpec.configure do |config|
  config.around(:each, :instrument) do |example|
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    begin
      example.run
    ensure
      duration = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time
      RSpec.configuration.reporter.message "⏱️ #{example.full_description} took #{duration.round(3)}s"
      # additional cleanup logic here
    end
  end
end

RSpec.describe MyService, :instrument do
  it 'processes data efficiently' do
    expect(MyService.call).to be_success
  end
end
```

This pattern centralizes timing and cleanup, making your examples declarative and focused on assertions.