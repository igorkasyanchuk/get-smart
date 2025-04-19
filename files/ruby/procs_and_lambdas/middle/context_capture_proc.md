## 📦 Capture Surrounding Context with Procs
Procs retain the surrounding lexical scope, allowing you to access local variables even after the scope ends. This is ideal for callbacks that need to remember context without storing extra state. Simply define a Proc within the scope you want to capture.

```ruby
def counter
  count = 0
  Proc.new { count += 1 }
end

increment = counter
puts increment.call   # 1
debugger; puts increment.call   # 2