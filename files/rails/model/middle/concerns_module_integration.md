## 📦 Use concerns to share common logic across models

To avoid duplication, extract shared logic into modules:

```ruby
# app/models/concerns/trackable.rb
module Trackable
  extend ActiveSupport::Concern

  included do
    has_many :activities, as: :trackable
  end

  def track_creation
    activities.create(action: 'created')
  end
end

# app/models/post.rb
class Post < ApplicationRecord
  include Trackable
end
```

Now `Post` has the `track_creation` method and associated activities.