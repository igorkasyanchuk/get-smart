## ⚙️ Benchmark Long‑Running Rake Tasks

Integrate benchmarking into your Rake tasks to monitor performance regressions during background jobs or data migrations. This ensures you catch slowdowns before they hit production.

```ruby
# lib/tasks/data_migration.rake
task benchmark_data_migration: :environment do
  require 'benchmark'

  time = Benchmark.realtime do
    MyModel.find_each(batch_size: 1000) do |record|
      record.update!(processed: true)
    end
  end

  puts "Data migration took #{time.round(2)} seconds"
end
```

Using `Benchmark.realtime` returns a float in seconds—perfect for simple logging. Wrap each sub-step if you need finer granularity.