## 🔍 Selecting Entries with Conditions
Use `select` or its alias `filter` to extract key-value pairs matching specific criteria. It returns a new hash with elements for which the block returns true.

```ruby
grades = { alice: 85, bob: 72, carol: 91 }
high_scores = grades.select { |student, score| score >= 80 }
puts high_scores  # => {:alice=>85, :carol=>91}
```