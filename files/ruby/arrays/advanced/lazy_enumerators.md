## 🐢 Processing Large Arrays Lazily with `Enumerator::Lazy`

When working with huge or infinite sequences, convert your array (or Range) to a lazy enumerator to defer computation until needed. Chaining `lazy.select.map` prevents building intermediate arrays and minimizes memory overhead. Call methods like `first` or `take` to realize only the required elements.

```ruby
numbers = (1..Float::INFINITY).lazy
even_squares = numbers.select(&:even?).map { |n| n**2 }
p even_squares.first(5)
# => [4, 16, 36, 64, 100]
```