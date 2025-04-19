## 🔗 Chaining Transformations with Transform Keys/Values

Ruby 2.5+ introduced `transform_keys` and `transform_values`. Compose them with `then` for a clean pipeline:

```ruby
raw = { 'FirstName' => 'Bob', 'LAST_NAME' => 'Smith', 'age' => 30 }

result = raw
  .transform_keys(&:downcase)
  .transform_keys { |k| k.to_sym }
  .transform_values do |v|
    v.is_a?(String) ? v.capitalize : v
  end
  .then do |h|
    # add full_name
    h.merge(full_name: "#{h[:firstname]} #{h[:last_name]}")
  end

#=> {:firstname=>"Bob", :last_name=>"Smith", :age=>30, :full_name=>"Bob Smith"}
```

This declarative style keeps each transformation focused and readable, ideal for data normalization pipelines.