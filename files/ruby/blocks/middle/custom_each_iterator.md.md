## 🔄 Define Custom Iterators with `yield`

Creating your own iterator methods helps encapsulate collection logic. You can use `yield` to pass each element to the block provided by the caller. This approach mimics Ruby’s `Enumerable` behavior and keeps consumer code clean.

```ruby
class MyCollection
  def initialize(items)
    @items = items
  end

  def each
    @items.each do |item|
      yield(item)
    end
    self
  end
end

coll = MyCollection.new([1, 2, 3])
coll.each do |n|
  puts n * 2
end
# Outputs:
# 2
# 4
# 6
```