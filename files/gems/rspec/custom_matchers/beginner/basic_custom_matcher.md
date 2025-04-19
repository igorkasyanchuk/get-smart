## 🔨 Define a Basic Matcher
Creating a simple matcher helps you express intent clearly in specs. You can wrap repetitive checks in a readable DSL by using `RSpec::Matchers.define`.

```ruby
# spec/support/matchers/be_sorted.rb
RSpec::Matchers.define :be_sorted do
  match do |actual|
    actual == actual.sort
  end
end
```

Now you can write:

```ruby
expect([1, 3, 2]).to be_sorted
```