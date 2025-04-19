## 🔧 Dynamic `define_method` with parameterized behaviors
Use `define_method` to create methods at runtime based on metadata, keeping your code DRY and adaptable. This approach allows you to inject custom logic for each generated method by capturing local variables in closures.

```ruby
class Model
  ATTRIBUTES = %i[name age email]

  ATTRIBUTES.each do |attr|
    define_method("find_by_#{attr}") do |value|
      where(attr => value).first
    end
  end
end
```