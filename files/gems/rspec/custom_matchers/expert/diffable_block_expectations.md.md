## 🎯 Leveraging `diffable` and Block Expectations for Rich Output

For assertions that involve large objects or side effects, combining `diffable` and `supports_block_expectations` in custom matchers enhances clarity by providing inline diffs and capturing exceptions. This technique gives you granular control over failure output and allows matchers to wrap code blocks for complex state changes.

```ruby
# spec/support/matchers/change_database_record.rb
RSpec::Matchers.define :change_database_record do |model_class, id|
  supports_block_expectations
  diffable

  match do |block|
    @record_before = model_class.find(id).attributes
    block.call
    @record_after = model_class.find(id).attributes
    @record_before != @record_after
  end

  failure_message do |block|
    "expected block to change #{model_class}##{id} attributes, but it didn't.\n" +
      "Before: #{@record_before.inspect}\nAfter: #{@record_after.inspect}"
  end
end

# Usage in a spec:
expect { user.update!(name: 'New') }.to change_database_record(User, user.id)
```