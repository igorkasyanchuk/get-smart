## 🧩 Simplify Alternatives with Branch Reset Groups

Branch reset groups `(?|...)` reset the capture numbering for each branch, so named or numbered captures align across alternatives. This cuts complexity when post-processing matches.

```ruby
pattern = /(?|
  (?<key>\w+)= (?<val>\d+)
 |
  (?<val>\d+)&(?<key>\w+)
)/x

m1 = "age=30".match(pattern)
# m1[:key] => "age", m1[:val] => "30"

m2 = "30&age".match(pattern)
# m2[:key] => "age", m2[:val] => "30"
```

Every branch uses the same capture names or numbers, simplifying downstream logic.