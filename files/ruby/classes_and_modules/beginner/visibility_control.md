## 🔒 Control Method Visibility

Ruby supports `public`, `protected`, and `private` keywords to limit method access. By default, methods are public. Use `private` to restrict usage to the defining class only. `protected` allows access from the same class or subclasses.

```ruby
class Person
  def public_info
    'public'
  end

  private

  def secret_info
    'secret'
  end
end

puts Person.new.public_info  # => 'public'
# Person.new.secret_info      # => NoMethodError
```