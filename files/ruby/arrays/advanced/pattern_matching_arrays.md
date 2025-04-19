## 🧩 Destructuring Nested Arrays with Pattern Matching

Ruby 3’s pattern matching can unpack complex nested arrays in a concise way. Use the `in` keyword in `case` or within method parameters to extract values, ignoring or capturing rest elements. This makes your code more declarative and reduces manual indexing.

```ruby
def analyze(data)
  case data
  in [user_id, [year, month, day], *tags]
    puts "User #{user_id} on #{year}-#{month}-#{day} with tags: #{tags.inspect}"
  end
end

data = [42, [2023, 8, 15], 'ruby', 'arrays']
analyze(data)
```