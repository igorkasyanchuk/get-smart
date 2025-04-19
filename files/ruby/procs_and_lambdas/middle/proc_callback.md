## 🔄 Use Procs as Method Callbacks
Procs can be passed into methods to define custom behavior without requiring blocks. This is useful when you need to swap or store different callbacks dynamically. Simply accept a Proc parameter and call it inside your method using `call`.

```ruby
def process_items(items, callback)
  items.each { |item| callback.call(item) }
end

upcase_proc = Proc.new { |str| puts str.upcase }
numbers_proc = Proc.new { |n| puts n * 2 }

process_items(["apple", "banana"], upcase_proc)
process_items([1, 2, 3], numbers_proc)
```