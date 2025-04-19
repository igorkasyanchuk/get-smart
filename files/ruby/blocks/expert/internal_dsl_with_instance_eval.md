## 📜 Building Internal DSLs with instance_eval
Use `instance_eval` to execute a block in the context of an object, switching `self` so DSL methods read like native language constructs. This approach leverages closures to capture environment and define concise APIs for configuration or markup.

```ruby
class HTMLBuilder
  def initialize(&block)
    @result = ''
    instance_eval(&block)
  end

  def element(name, content = nil, &block)
    @result << "<#{name}>"
    if block
      instance_eval(&block)
    else
      @result << content.to_s
    end
    @result << "</#{name}>"
  end

  def to_s
    @result
  end
end

html = HTMLBuilder.new do
  element :p, 'Hello'
  element :div do
    element :span, 'Nested'
  end
end

puts html.to_s
```