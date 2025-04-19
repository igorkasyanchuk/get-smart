## 🔍 Leverage Pattern Matching with Ranges
Ruby 2.7+ supports pattern matching in `case` and `match`, letting you concisely branch on numeric or lexical ranges. It’s a game-changer for validation, routing, or command parsing without nested ifs.

```ruby
def tax_bracket(income)
  case income
  in ..9_875           then :low
  in 9_876..40_125     then :middle
  in 40_126..85_525    then :upper_middle
  in 85_526..           then :high
  end
end

puts tax_bracket(50_000)  # => :upper_middle

# Destructure with range in hash patterns
payload = { status: 200, size: 1500 }
case payload
in { status: 200..299, size: 0..(1<<20) }
  puts "OK & small"
end
```