## 🧩 Modify Single Object with `instance_eval`

`instance_eval` runs code in the context of a single object, letting you add methods or modify its state privately. It’s perfect for customizing behavior without affecting other instances.

```ruby
str = "hello"
str.instance_eval do
  def shout
    upcase + "!"
  end
end

puts str.shout   # => "HELLO!"
```