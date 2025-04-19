## 📂 Splitting Arrays with `partition`
`Array#partition` splits an array into two subarrays based on a predicate, returning `[true_group, false_group]`. It’s perfect for categorizing data in one pass.

```ruby
nums = (1..10).to_a
even, odd = nums.partition(&:even?)
# even => [2,4,6,8,10], odd => [1,3,5,7,9]
```
