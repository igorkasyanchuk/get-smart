## 🧩 Use Modules for Namespacing

Prevent name collisions by nesting classes or modules inside modules. This organizes code into logical sections. Access nested constants or classes with the `::` operator.

```ruby
module Admin
  class User
    def role
      'admin'
    end
  end
end

puts Admin::User.new.role  # => 'admin'
```