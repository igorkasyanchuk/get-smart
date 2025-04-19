## 🔗 Custom Enumerator Chaining
Build custom enumerators that lazily chain multiple array sources without intermediate allocations. This tip shows how to implement a unified lazy chain method akin to Enumerable#chain.

```ruby
class LazyChain
  include Enumerable

  def initialize(*enumerables)
    @enums = enumerables.map(&:lazy)
  end

  def each
    @enums.each do |enum|
      enum.each { |e| yield e }
    end
  end
end

# Usage
a = [1,2]
b = [3,4]
chain = LazyChain.new(a, b)
chain.select(&:odd?).first(3) # => [1,3]
```