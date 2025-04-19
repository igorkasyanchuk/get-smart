## 🔒 Short-Circuit Iterators with `break`, `next`, and `return`

Blocks can control the flow of their enclosing method differently depending on context. Use `break` to exit an iterator, `next` to skip, or `return` to exit the entire method. Understand these semantics to avoid surprises.

```ruby
def find_first_even(array)
  array.each do |n|
    return n if n.even?
  end
  nil
end

puts find_first_even([1,3,4,5])
# => 4

[1,2,3].each do |n|
  next unless n.even?
  puts "Found even: #{n}"
  break
end
# => Found even: 2
```