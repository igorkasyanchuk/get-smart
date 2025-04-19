## 📨 Dynamic Invocation with `send` and `public_send`
Dynamically calling methods by name is powerful for implementing flexible APIs, delegates, or command patterns. Use `public_send` to avoid bypassing visibility constraints, and fall back to `send` only when you must access private or protected methods. Always check `respond_to?` to handle missing methods gracefully.

```ruby
class Printer
  def format(text); "<<#{text}>>"; end
  private
def secret; "42"; end
end

p = Printer.new
if p.respond_to?(:format)
  puts p.public_send(:format, "Hello")  #=> <<Hello>>
end

# Access private method only if you really need to
puts p.send(:secret)  #=> "42"
```