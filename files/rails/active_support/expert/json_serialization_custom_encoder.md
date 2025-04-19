## 📦 Customize JSON Serialization with ActiveSupport::JSON
Extend `ActiveSupport::JSON::Encoding` to handle domain-specific objects seamlessly. Register custom encoders for non-serializable types and control depth, formatting, or key transformations.

```ruby
module ActiveSupport
  module JSON
    module Encoding
      class CustomEncoder < JSONGemEncoder
        def encode(value)
          if value.is_a?(Money)
            %{"#{value.currency.iso_code}":#{value.cents / 100.0}}
          else
            super
          end
        end
      end
    end
  end
end

ActiveSupport::JSON.backend = ActiveSupport::JSON::Encoding::CustomEncoder.new

# Now
Money.new(500, "USD").to_json # => {"USD":5.0}
```

This method integrates domain types into Rails’ JSON pipeline without manual `as_json` in each model.