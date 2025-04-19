## 🔗 Use Symbol#to_proc Shorthand
The `&:method_name` syntax converts a symbol to a block with `#to_proc`. Beyond simple maps, you can combine it with methods like `slice_before`, `sort_by`, and even user-defined methods for elegant one-liners.

```ruby
users = [ OpenStruct.new(name: "Alice"), OpenStruct.new(name: "Bob") ]
names = users.map(&:name)
# => ["Alice", "Bob"]

# Group numbers whenever an even number appears
[1,2,3,4,5,6].slice_before(&:even?).to_a
# => [[1], [2, 3], [4, 5], [6]]
```