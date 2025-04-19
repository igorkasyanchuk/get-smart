## 🏎 Profile Test Performance with RSpec Profiling API
Identify bottlenecks by integrating RSpec's built‑in profiling and custom benchmark helpers. Mark slow specs and surface N+1 queries or heavy logic under test.

```ruby
# .rspec
--profile 10

RSpec.configure do |config|
  config.around(:each, :benchmark) do |example|
    time = Benchmark.realtime { example.run }
    puts "[Benchmark] #{example.full_description}: #{time.round(4)}s"
  end
end

RSpec.describe DataImporter, :benchmark do
  it 'processes large CSV efficiently' do
    importer = DataImporter.new('big.csv')
    importer.run
    expect(importer.records_imported).to eq(10_000)
  end
end
```