## 🔗 Chaining Procs in Enumerable Pipelines
By converting methods and lambdas to Procs, you can build flexible, reusable pipelines for collections. Combine filtering, mapping, and reduction in a declarative style that’s easy to test and modify.

```ruby
# Define reusable procs
strip  = ->(s) { s.strip }
ulcase = ->(s) { s.downcase }
valid  = ->(s) { s.match?(/^[a-z]+$/) }

words = [" Apple ", "Banana123", " carrot "]

# Chain them with Symbol#to_proc and lambdas
result = words
  .map(&strip)
  .map(&ulcase)
  .select(&valid)

puts result.inspect  # => ["apple", "carrot"]
```