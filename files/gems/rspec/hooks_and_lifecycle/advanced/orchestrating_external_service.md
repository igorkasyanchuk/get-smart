## 🛠️ Orchestrate External Services with before(:suite)/after(:suite)

When your test suite depends on an external service (e.g., Elasticsearch, Redis, Kafka), spinning up and tearing down containers for each example is expensive. Use `before(:suite)` and `after(:suite)` to start and stop the service only once per suite.

Configure RSpec in `spec/spec_helper.rb` or `spec/rails_helper.rb`:

```ruby
# spec/spec_helper.rb
RSpec.configure do |config|
  config.before(:suite) do
    # Start Docker container via docker-api gem
    container = Docker::Container.create(
      'Image' => 'elasticsearch:7.10.0',
      'name'  => 'test-elasticsearch'
    )
    container.start

    # Wait until the service is healthy
    Timeout.timeout(30) do
      loop do
        break if `curl -s http://localhost:9200`.include?('"status"')
        sleep 1
      end
    end
  end

  config.after(:suite) do
    # Cleanly stop and remove
    container = Docker::Container.get('test-elasticsearch')
    container.stop
    container.delete(force: true)
  end
end
```

This approach ensures minimal overhead, maintaining a single service instance throughout the suite. Replace with any service or orchestrator as needed.