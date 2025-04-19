## 🏭 Building Custom Enumerable Classes for Complex Data Structures

Implementing `each` in your own class unlocks the full power of `Enumerable`—`map`, `select`, `group_by`, and more. Here’s an example of depth‐first traversal over a nested hash tree. You can now call any Enumerable method directly on your class, making your API clean and idiomatic.

```ruby
class DeepFinder
  include Enumerable

  def initialize(tree)
    @tree = tree
  end

  def each
    stack = [@tree]
    until stack.empty?
      node = stack.pop
      yield node[:value]
      stack.concat(node[:children]) if node[:children]
    end
  end
end

# Usage
tree = { value: 1, children: [ { value: 2 }, { value: 3, children: [ { value: 4 } ] } ] }
finder = DeepFinder.new(tree)
puts finder.select { |v| v.odd? }  # => [1, 3]
```