## 🔁 Understanding Blocks
Blocks are anonymous functions you can pass to methods. They capture surrounding context and can be invoked with `yield`. Use blocks for simple callbacks or custom iteration logic.

```ruby
def repeat(times)
  times.times { yield }
end

repeat(3) { puts "Hi!" }
```