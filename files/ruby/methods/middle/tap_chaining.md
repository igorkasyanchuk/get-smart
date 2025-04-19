## 🔗 Using tap for Method Chaining

The `tap` method yields the object to a block and returns the object itself, making it ideal for inline debugging or configuring objects in a chain. It helps keep code fluent without breaking the chain.

```ruby
user = User.new
  .tap { |u| Rails.logger.debug "Building user: #{u.inspect}" }
  .assign_attributes(name: 'Alice', email: 'a@example.com')
  .tap(&:save)

# Equivalent without tap
user = User.new
Rails.logger.debug "Building user: #{user.inspect}"
user.assign_attributes(...)
user.save
```