## 🎯 Pattern Matching with Ranges
Ruby 2.7+ supports using ranges in `case/in` patterns, enabling concise branching for numeric tests or sequence destructuring.

```ruby
def grade(score)
  case score
  in 90..100 then 'A'
  in 75...90 then 'B'
  in 60...75 then 'C'
  else           'F'
  end
end

p grade(88)  # => "B"
``` 

You can also combine it with array patterns:

```ruby
data = [42, "ok"]
case data
in (1..50), String
  puts "Number in 1–50 and a string"
else
  puts "No match"
end
```