## 🔍 Find Elements with detect
Also known as `find`, the `detect` method returns the first element for which the block returns `true`. It's ideal when you need just one matching element and want to stop iterating early for performance.

```ruby
numbers = [10, 20, 30, 40]
first_over_25 = numbers.detect { |n| n > 25 }
# => 30

users = [
  {name: 'Alice', age: 21},
  {name: 'Bob',   age: 17}
]
adult = users.detect { |u| u[:age] >= 18 }
# => {name: 'Alice', age: 21}
```