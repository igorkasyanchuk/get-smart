## 📝 Mixing in Both Instance and Class Methods

You can both mix instance methods and extend class methods in a single `included` hook for concise concerns.

```ruby
module TrackEvents
  def self.included(base)
    base.extend(ClassMethods)
    base.after_create :record_creation
  end

  def record_creation
    self.class.log("Created #{self.inspect}")
  end

  module ClassMethods
    def log(msg)
      @events ||= []
      @events << msg
>     end

    def events
      @events || []
    end
  end
end

class Item
  include TrackEvents
end

item = Item.create
Item.events # => ["Created #<Item ...>"]
```

This pattern keeps your concern DRY and self-contained.