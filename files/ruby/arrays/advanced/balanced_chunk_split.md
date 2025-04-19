## 🔪 Splitting an Array into N Balanced Chunks

To divide an array into *n* parts as evenly as possible, calculate slice sizes and use `each_with_index` to assign elements. This ensures chunks differ by at most one element, useful for parallel processing or pagination.

```ruby
def split_into_chunks(arr, n)
  size, rem = arr.size.divmod(n)
  arr.each_with_index.with_object(Array.new(n) { [] }) do |(el,i), chunks|
    idx = i.div(size + (i < rem ? 1 : 0))
    chunks[idx] << el
  end
end

p split_into_chunks((1..10).to_a, 3)
# => [[1,2,3,4], [5,6,7], [8,9,10]]
```