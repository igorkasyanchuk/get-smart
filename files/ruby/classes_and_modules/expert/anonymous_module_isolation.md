## 🧱 Ensuring Isolation with Anonymous Modules
Anonymous modules (modules without a name) can encapsulate behavior without polluting your application namespace. They’re excellent for one-off mixins or temporary behaviors in tests and scripts.

```ruby
handler = Module.new do
  def process(data)
    data.upcase.reverse
  end
end

class Processor
  include handler
end

puts Processor.new.process('abc')
```

Since the module has no constant name, you avoid naming collisions and keep your global namespace clean.