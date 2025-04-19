## 🔄 Bidirectional Association Caching
Cache inverse associations manually to prevent N+1 loads when traversing back-and-forth relations. This is critical for graph-processing workloads.

```ruby
class Node < ApplicationRecord
  has_many :out_edges, class_name: 'Edge', foreign_key: :source_id
  has_many :in_edges,  class_name: 'Edge', foreign_key: :target_id

  def preload_edges
    Edge.where(source_id: id).or(Edge.where(target_id: id)).load
    self
  end

  def neighbors
    preload_edges
    (out_edges.map(&:target) + in_edges.map(&:source)).uniq
  end
end
```