## 🧐 Simple Conditionals
Use `if`, `elsif`, and `else` to execute code based on conditions. Conditionals help you control program flow easily. Ternary operators provide a compact alternative for simple branches.

```ruby
score = 85
if score >= 90
  puts "A"
elsif score >= 80
  puts "B"
else
  puts "C"
end

# Ternary example
puts score >= 50 ? "Pass" : "Fail"
```