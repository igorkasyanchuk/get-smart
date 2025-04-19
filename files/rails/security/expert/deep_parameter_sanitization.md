## 🔒 Deep Parameter Sanitization
When dealing with highly nested JSON or complex form data, default strong parameters may miss malicious payloads in sub-hashes or arrays. Roll your own sanitizer by recursively filtering keys you explicitly allow and rejecting everything else. This ensures only the exact structure you expect reaches your models.

```ruby
class ApplicationController < ActionController::Base
  before_action :sanitize_params!

  private

  def sanitize_params!
    params.deep_transform_keys!(&:to_s)
    params.replace(filter_hash(params.to_unsafe_h, allowed_structure))
  end

  def filter_hash(hash, structure)
    hash.each_with_object({}) do |(key, value), memo|
      next unless structure.key?(key.to_sym)
      allowed = structure[key.to_sym]
      memo[key] =
        case value
        when Hash then filter_hash(value, allowed)
        when Array then value.map { |v| v.is_a?(Hash) ? filter_hash(v, allowed[:array]) : v }
        else value
        end
    end
  end

  def allowed_structure
    {
      order: { customer_id: true, items: { array: { product_id: true, quantity: true } } }
    }
  end
end
```
