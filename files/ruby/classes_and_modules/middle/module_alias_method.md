## ↪️ Preserving Original Methods with `alias_method`

When overriding methods in modules, use `alias_method` to keep a reference to the original. This enables you to wrap or conditionally call the original implementation without losing it.

```ruby
module Tracker
  def save
    track_changes
    original_save
  end

  def self.included(base)
    base.class_eval do
      alias_method :original_save, :save
      include Tracker
    end
  end

  def track_changes
    puts "Tracked changes"
  end
end
```