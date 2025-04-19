## 🎯 Dynamic Method Definition with define_method
Leverage `define_method` to generate methods at runtime, capturing surrounding scope and enabling concise DSLs. This approach creates methods based on dynamic data and closures, reducing boilerplate and enhancing flexibility.

```ruby
class Resource
  [:create, :update, :delete].each do |action|
    define_method(action) do |attributes|
      puts "#{action} called with #{attributes.inspect}"
    end
  end
end

resource = Resource.new
resource.create(name: 'Test')  # => "create called with {:name=>\"Test\"}"
```

```ruby
obj = Object.new
obj.define_singleton_method(:greet) { "Hi from #{self}" }
puts obj.greet  # => "Hi from #<Object:0x00007fae98839c40>"
```