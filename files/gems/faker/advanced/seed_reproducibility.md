## 🔄 Seeding Faker for Reproducible Tests

By default Faker uses a global RNG, resulting in different outputs each run. For deterministic test data, set `Faker::Config.random` or call `Faker::Config.seed`. You can even seed per‑thread for parallel tests. This ensures the same sequence of values for each seed.

```ruby
# spec/support/faker_seed.rb
RSpec.configure do |config|
  config.before(:suite) do
    Faker::Config.random = Random.new(20231010) # fixed seed
  end
end

# In a parallel test:
thread1 = Thread.new do
  Faker::Config.random = Random.new(1)
  puts Faker::Name.name  # always same within this thread
end
thread2 = Thread.new do
  Faker::Config.random = Random.new(2)
  puts Faker::Name.name
end
thread1.join; thread2.join
```

Using a fixed seed eliminates flaky data‑driven tests and makes debugging data easier across CI runs.