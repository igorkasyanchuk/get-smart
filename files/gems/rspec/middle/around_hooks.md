## 🔄 Around Hooks

`around` hooks wrap the execution of individual examples, useful for setup and teardown you want to combine. For example, measure execution time or temporarily modify configuration.

```ruby
RSpec.describe ApiClient do
  around(:each) do |example|
    start = Time.now
    example.run
    duration = Time.now - start
    puts "Example took #{duration.round(2)} seconds"
  end

  it "fetches data from the endpoint" do
    expect(subject.fetch('/status')).to include("ok")
  end
end
```
