## 🛠️ Dynamically Defining Methods with define_method

`define_method` lets you create methods at runtime based on dynamic requirements, reducing repetitive code. It accepts a symbol and a block, where block arguments become method parameters.

```ruby
class EventHandler
  %w[create update delete].each do |action|
    define_method("on_#{action}") do |record|
      puts "Handling #{action} for #{record.inspect}"
    end
  end
end

handler = EventHandler.new
handler.on_create({id:1})  #=> Handling create for {:id=>1}
handler.on_delete({id:2})  #=> Handling delete for {:id=>2}
```