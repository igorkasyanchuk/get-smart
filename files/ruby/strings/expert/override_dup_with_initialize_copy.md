## 🎯 Customize cloning via initialize_copy

By overriding `initialize_copy`, you gain full control over how `dup` and `clone` behave for your string subclass. You can sanitize content, reset internal caches, or share buffers conditionally. This is a powerful hook when building DSL-backed string types.

```ruby
class MyString < String
  def initialize_copy(orig)
    super
    # strip trailing whitespace on clone
    self.replace(self.rstrip)
    # clear any custom cache
    @metadata = {}
  end
end

s1 = MyString.new("hello   ")
s2 = s1.dup
puts s2.inspect  # => "hello"
```