## 🛑 Aggregate Failures

Using `aggregate_failures` allows multiple expectations to run in one example, reporting all failures together. This reduces feedback loops when validating multiple attributes at once.

```ruby
RSpec.describe User do
  it "has valid attributes" do
    aggregate_failures do
      expect(user.name).to eq('Alice')
      expect(user.email).to include('@')
      expect(user.age).to be > 18
    end
  end
end
```
