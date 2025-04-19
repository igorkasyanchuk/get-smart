## 📁 Organizing Concerns with Namespaces

Keep controllers and models clean by grouping related modules inside a `Concerns` namespace. This avoids name collisions and improves discoverability.

```ruby
# app/models/concerns/archivable.rb
module Concerns
  module Archivable
    extend ActiveSupport::Concern

    included do
      scope :archived, -> { where(archived: true) }
    end

    def archive!
      update!(archived: true)
    end
  end
end

class Post < ApplicationRecord
  include Concerns::Archivable
end

Post.archived # => ActiveRecord::Relation
```

Use a top-level `Concerns` namespace in `app/*/concerns` for consistency.