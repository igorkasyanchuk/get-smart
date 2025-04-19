## 📣 Adding `inherited` Hooks via a Module

Although modules lack `inherited`, you can inject it into classes upon inclusion to track subclassing automatically.

```ruby
module TrackSubclass
  def self.included(base)
    base.singleton_class.prepend(ClassMethods)
  end

  module ClassMethods
    def inherited(subclass)
      super
      puts "#{subclass} < #{self}"
    end
  end
end

class Parent
  include TrackSubclass
end

class Child < Parent; end # => "Child < Parent"
```

Use this pattern to register or audit new subclasses at load time.