## 📊 Group and Count Using `each_with_object`

For flexible grouping and counting, `group_by` is common but returns arrays. Use `each_with_object` to accumulate directly into a Hash with counts or transformed values.

```ruby
records = [
  {category: 'books', title: 'Ruby 101'},
  {category: 'tools', title: 'Rails Console'},
  {category: 'books', title: 'Metaprogramming Ruby'}
]

counts = records.each_with_object(Hash.new(0)) do |rec, acc|
  acc[rec[:category]] += 1
end
# => {"books"=>2, "tools"=>1}

titles = records.each_with_object({}) do |rec, acc|
  acc[rec[:category]] ||= []
  acc[rec[:category]] << rec[:title]
end
# => {"books"=>["Ruby 101", "Metaprogramming Ruby"], "tools"=>["Rails Console"]}
```