## 🔄 Nested `transform_keys` and `transform_values`

ActiveSupport adds `transform_keys`/`transform_values`, but they don’t recurse by default. Create recursive variants to normalize keys or values at all depths.

```ruby
class ::Hash
  def deep_transform_keys(&block)
    result = {}
    each do |key, value|
      new_key = block.call(key)
      new_val = value.is_a?(Hash) ? value.deep_transform_keys(&block) : value
      result[new_key] = new_val
    end
    result
  end
end

snake_hash = { 'UserName' => { 'ProfileImage' => 'url' } }
snake_hash.deep_transform_keys { |k| k.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase }
# => {"user_name"=>{"profile_image"=>"url"}}
```