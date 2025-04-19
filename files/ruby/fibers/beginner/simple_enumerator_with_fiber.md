## 🗒️ Building a Simple Enumerator with Fiber

You can wrap a fiber in an `Enumerator` to create a custom sequence generator. The fiber yields values, and the enumerator handles resume calls under the hood. This is a quick way to build lazy sequences without complex classes.

```ruby
enum = Enumerator.new do |yielder|
  i = 1
  loop do
    yielder << i
    i += 1
  end
end

p enum.take(5)  # => [1, 2, 3, 4, 5]
```