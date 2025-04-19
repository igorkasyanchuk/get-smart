## ⏳ Injecting Timestamp Attributes

Dynamically add `created_at` and `updated_at` attributes with callbacks using a mixin. This pattern emulates ActiveRecord-like timestamping.

```ruby
module Timestampable
  def self.included(base)
    base.class_eval do
      attr_accessor :created_at, :updated_at
      define_method(:save) do
        now = Time.now
        self.created_at ||= now
        self.updated_at = now
        # actual persistence logic...
      end
    end
  end
end

class Record
  include Timestampable
end

r = Record.new
r.save
puts r.created_at, r.updated_at  # => current times
```