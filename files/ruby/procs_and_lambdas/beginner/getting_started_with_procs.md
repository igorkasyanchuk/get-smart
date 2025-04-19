## 📝 Getting Started with Procs

Procs are objects that hold blocks of code you can store in variables, pass around, and call later. They’re created with `Proc.new` or the `proc` keyword. Use them to encapsulate behavior and reuse it without rewriting the same block.

```ruby
# Define a proc
my_proc = Proc.new { |name| puts "Hello, #{name}!" }
# Call the proc
my_proc.call("Alice")  # => Hello, Alice!
```