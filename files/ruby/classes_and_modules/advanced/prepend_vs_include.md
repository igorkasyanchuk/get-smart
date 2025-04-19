## 🛠️ Choosing `prepend` vs `include` for Method Lookup Order

Ruby 2.0+ lets you inject behavior before or after a class’s existing methods. `include` inserts the module after the class, while `prepend` puts it before, allowing you to wrap or override methods.

```ruby
module Logger
  def save
    puts "Logging before save"
    super
  end
end

class Record
  def save
    puts "Original save"
  end
end

class A < Record
  include Logger
end

class B < Record
  prepend Logger
end

A.new.save  # => "Original save" then "Logging before save"
B.new.save  # => "Logging before save" then "Original save"
```

Use `prepend` for aspect-oriented patterns and `include` for simple mixins.