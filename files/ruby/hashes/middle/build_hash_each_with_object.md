## 🏗️ Building a Hash with `each_with_object`

`each_with_object` is great for constructing a hash while iterating over an array or another hash. You can accumulate key-value pairs in a single pass.

```ruby
users = ['alice', 'bob', 'carol']
# Map each user to its length
lengths = users.each_with_object({}) do |name, acc|
  acc[name] = name.length
end
# => { 'alice' => 5, 'bob' => 3, 'carol' => 5 }
```