## 🌐 Computing Transitive Closure with Set
You can compute the transitive closure of a directed graph efficiently by iterating until no new nodes are discovered. Using `Set` for the visited collection and for each step’s frontier keeps membership checks O(1) on average.

```ruby
require 'set'

def transitive_closure(adj_list, start)
  visited = Set[start]
  frontier = Set[start]

  until frontier.empty?
    next_frontier = Set.new
    frontier.each do |node|
      (adj_list[node] || []).each do |neighbor|
        unless visited.include?(neighbor)
          visited.add(neighbor)
          next_frontier.add(neighbor)
        end
      end
    end
    frontier = next_frontier
  end

  visited
end

# Example adjacency list
graph = {
  1 => [2,3],
  2 => [4],
  3 => [4,5],
  4 => [],
  5 => [1]
}

closure = transitive_closure(graph, 1)
puts closure.to_a.sort.inspect
# => [1,2,3,4,5]
```