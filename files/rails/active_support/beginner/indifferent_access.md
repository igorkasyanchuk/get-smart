## 🔑 Use Hash#with_indifferent_access

Rails lets you access hash keys as symbols or strings interchangeably with `with_indifferent_access`. This is especially helpful when working with params or external data where key types vary.

```ruby
params = { 'user' => { 'name' => 'Alice' } }
user = params.with_indifferent_access[:user]
user[:name]       # => "Alice"
user['name']      # => "Alice"
```
