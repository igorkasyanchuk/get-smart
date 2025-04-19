## 📐 N-dimensional Array Generator
Recursively generate N-dimensional arrays with custom default values or computed contents. This pattern simplifies creation of multi-dimensional grids or tensors.

```ruby
def n_dimensional(dimensions, &block)
  size, *rest = dimensions
  Array.new(size) do |i|
    rest.empty? ? block.call(i) : n_dimensional(rest, &block)
  end
end

# Usage: 2x3x4 tensor with index value
tensor = n_dimensional([2,3,4]) { |i| i }
p tensor[1][2][3]   # => 3
```