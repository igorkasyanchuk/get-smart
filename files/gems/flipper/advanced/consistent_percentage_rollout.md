## 🎯 Implement a Consistent Percentage Rollout
When rolling out to a subset of users, you want assignments to be consistent across sessions. By registering a custom gate that hashes an actor’s unique identifier, you ensure deterministic inclusion in the rollout percentage.

```ruby
# config/initializers/flipper.rb
require 'digest'

module Flipper
  module Gates
    class ConsistentPercentageOfActors < Gate
      def name
        :consistent_percentage_of_actors
      end

      def open?(value, actor)
        return false unless actor&.flipper_id

        # Hash actor ID into [0, 100)
        bucket = Digest::MD5.hexdigest(actor.flipper_id).to_i(16) % 100
        bucket < value.to_i
      end
    end
  end
end

Flipper.register(Flipper::Gates::ConsistentPercentageOfActors.new)

# Usage: roll out to 15% of users
Flipper.enable(:new_dashboard, Flipper::Types::Integer.new(15), gate: :consistent_percentage_of_actors)
```