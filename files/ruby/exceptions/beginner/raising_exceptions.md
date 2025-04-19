## 🚩 Raise custom exceptions
Use `raise` to signal errors manually and define custom exception classes by inheriting from `StandardError`. This helps communicate error conditions clearly within your code.

```ruby
def divide(a, b)
  raise ArgumentError, 'Division by zero' if b.zero?
  a / b
end

begin
  divide(10, 0)
rescue ArgumentError => e
  puts e.message
end
```

```ruby
class MyError < StandardError; end

def do_work
  raise MyError, 'Something went wrong'
end

begin
  do_work
rescue MyError => e
  puts e.message
end
```