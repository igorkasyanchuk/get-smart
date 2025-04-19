## 🔍 Overriding `respond_to_missing?` for Accurate Reflection

After customizing `method_missing`, update `respond_to_missing?` so `respond_to?` returns correct results. This keeps introspection methods and tools (like IRB and Rails) working properly.

```ruby
class Chatter
  def method_missing(name, *args)
    if name.to_s.start_with?('say_')
      message = name.to_s.sub('say_', '')
      puts message.tr('_', ' ')
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?('say_') || super
  end
end

chat = Chatter.new
chat.say_hello_world       # => "hello world"
puts chat.respond_to?(:say_hello_world)  # => true
```