## 🔄 Memory Safe ObjectGraphs with WeakRef

Use `WeakRef` to manage circular references in object graphs, preventing memory leaks by allowing the GC to collect objects when only weak references exist.

```ruby
require 'weakref'

class Node
  attr_reader :value, :parent
  def initialize(val)
    @value = val
  end

  def parent=(node)
    @parent = WeakRef.new(node)
  end
end

root = Node.new('root')
child = Node.new('child')
child.parent = root

# root can still be collected if no strong refs exist
```