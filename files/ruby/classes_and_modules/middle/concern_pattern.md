## 🧱 Rails-Style Concern Pattern

Implement modules as concerns to group related methods and callbacks. This keeps your models and controllers cleaner by extracting reusable chunks of logic.

```ruby
# app/models/concerns/archivable.rb
module Archivable
  extend ActiveSupport::Concern

  included do
    scope :archived, -> { where.not(archived_at: nil) }
  end

  def archive!
    update!(archived_at: Time.current)
  end
end

class Document < ApplicationRecord
  include Archivable
end
```