## 📊 Group Arrays with `Enumerable#in_groups_of`
Split collections into fixed-size groups easily with `in_groups_of`. Provide a filler value to pad incomplete groups and iterate cleanly in views or batch processes.

```ruby
(1..7).to_a.in_groups_of(3)
# => [[1, 2, 3], [4, 5, 6], [7, nil, nil]]

(1..7).to_a.in_groups_of(3, fill_with: :x)
# => [[1, 2, 3], [4, 5, 6], [7, :x, :x]]
```
