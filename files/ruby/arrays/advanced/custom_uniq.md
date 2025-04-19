## 🎯 Deduplicating with Custom Criteria using `uniq`

`Array#uniq` can accept a block to determine uniqueness based on computed keys. This is powerful for de-duplicating complex objects or arrays by specific attributes. The method preserves the first occurrence of each key.

```ruby
users = [
  {id: 1, name: 'Alice'},
  {id: 2, name: 'Bob'},
  {id: 1, name: 'Alice Smith'}
]
unique = users.uniq { |u| u[:id] }
# => [{id:1, name:'Alice'}, {id:2, name:'Bob'}]
```