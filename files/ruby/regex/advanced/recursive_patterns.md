## 🌀 Parse Nested Parentheses with Recursion
Oniguruma’s recursion support allows matching balanced constructs by recursively referencing the named group. Define a group and use `(?&R)` within it to handle unlimited nesting.

```ruby
pattern = /\A\((?:[^()]+|(?<R>\((?&R)\)))*\)\z/
# Example: matches balanced parentheses
tests = ['(a(b)c)', '((x))', 'unbalanced(', '()']
tests.each do |s|
  puts "#{s}: #{!!(s.match(pattern))}"
end
```