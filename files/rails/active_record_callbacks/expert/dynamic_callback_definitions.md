## ✨ Dynamically Defining Callbacks via Metaprogramming
For models that share similar callback sequences with slight variations, define callbacks in a metaprogrammed loop. This centralizes logic and reduces boilerplate.

```ruby
module Trackable
  def self.included(base)
    base.class_eval do
      %i[create update destroy].each do |action|
        send("after_#{action}") do
          TrackingService.track(self, action)
        end
      end
    end
  end
end

class Article < ApplicationRecord
  include Trackable
end
```

This approach generates `after_create`, `after_update`, and `after_destroy` callbacks automatically, ensuring consistent behavior across models.