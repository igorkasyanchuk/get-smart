## ⚡️ Scale Tests with Parallel Testing and Sharded DB
Leverage RSpec's parallel feature alongside custom connection handlers for sharded databases. Configure unique database URLs per worker to isolate state and speed up large suites.

```ruby
# spec_helper.rb
if ENV['PARALLEL_WORKERS']
  RSpec.configure do |config|
    config.parallelize(processes: ENV['PARALLEL_WORKERS'].to_i)
    config.before(:suite) do
      ActiveRecord::Base.configurations['test_shard'] = ActiveRecord::Base.configurations['test'].dup
    end
    config.before(:each) do |example|
      shard_id = RSpec.world.example_groups.index(example.example_group) % ENV['PARALLEL_WORKERS'].to_i
      ActiveRecord::Base.establish_connection("test_shard_#{shard_id}")
    end
  end
end
```