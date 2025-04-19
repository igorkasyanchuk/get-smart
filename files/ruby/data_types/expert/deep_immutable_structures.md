## ❄️ Deep Immutable Structures with Refinements

Freezing top‑level objects often leaves nested arrays and hashes mutable. This refinement injects a `deep_freeze` method to recursively freeze every element, locking down entire graphs for thread‑safety and caching use cases.

```ruby
module DeepFreeze
  refine Object do
    def deep_freeze
      case self
      when Array then each(&:deep_freeze)
      when Hash  then each { |k,v| k.deep_freeze; v.deep_freeze }
      end
      freeze
    end
  end
end

using DeepFreeze
config = { users: [{name: 'Alice'}, {name: 'Bob'}], meta: { count: 2 }}
config.deep_freeze
# config[:users][0][:name] = 'Eve' # => RuntimeError: can't modify frozen String
```