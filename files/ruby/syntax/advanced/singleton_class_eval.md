## 🏗️ Modify Singletons with singleton_class_eval
To extend or override behavior on a single object instance, use `singleton_class` with `class_eval`. This avoids global monkey-patches and keeps modifications confined to one object.

```ruby
str = "hello"
str.singleton_class.class_eval do
  def excited
    self.upcase + "!!!"
  end
end

puts str.excited  # => "HELLO!!!"
puts "world".respond_to?(:excited)  # => false
```