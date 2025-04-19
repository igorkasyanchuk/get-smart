## 🔄 Flexible Setup and Teardown with `around` Hooks

The `around` hook gives you full control over example execution by wrapping setup and teardown logic around `example.run`. This is useful for tasks like timing, logging, or managing external resources in a single place.

```ruby
RSpec.configure do |config|
  config.around(:each) do |example|
    start_time = Time.now
    puts "\n[START] #{example.full_description} at #{start_time}"
    example.run
    duration = Time.now - start_time
    puts "[END] #{example.full_description} (#{duration.round(2)}s)"
  end
end

RSpec.describe MyService do
  it 'performs work efficiently' do
    expect(MyService.new.call).to be_truthy
  end
end
```

Here, every example will print its start time and duration, ensuring consistent logging without duplicating code in each spec.