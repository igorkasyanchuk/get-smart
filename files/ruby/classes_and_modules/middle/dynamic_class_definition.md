## 🏗️ Dynamically Defining Classes

You can create classes at runtime using `Class.new` and assign them to constants. This approach allows flexible DSLs or dynamic model generation without writing explicit class definitions.

```ruby
klass = Class.new do
  def greet
    "Hello from dynamic class"
  end
end

Object.const_set('Greeter', klass)

puts Greeter.new.greet
# => "Hello from dynamic class"
```