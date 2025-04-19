## 📋 Using Ranges in Case Statements

Ranges in `case-when` clauses let you express multi-branch logic concisely when evaluating numeric or date intervals. Ruby matches the first `when` clause whose range covers the value, improving readability over chained `if-elsif` blocks.

```ruby
score = 82
case score
when 0..59
  grade = 'F'
when 60..69
  grade = 'D'
when 70..79
  grade = 'C'
when 80..89
  grade = 'B'
else
  grade = 'A'
end
puts grade  # => "B"
```