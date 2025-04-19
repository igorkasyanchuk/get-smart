## 🛠️ Modularize Shared Behavior with ActiveSupport::Concern

ActiveSupport::Concern streamlines mixins by cleanly separating class methods, instance methods, and callbacks. You can bundle scopes, validations, or lifecycle hooks and include them in multiple models without polluting the global namespace. This keeps your code DRY and well organized.

```ruby
# app/models/concerns/archivable.rb
module Archivable
  extend ActiveSupport::Concern

  included do
    scope :archived, -> { where.not(archived_at: nil) }
    before_save :set_archived_at, if: :archived_changed?
  end

  def archive!
    update!(archived: true)
  end

  class_methods do
    def purge_archived
      archived.delete_all
    end
  end

  private

  def set_archived_at
    self.archived_at = Time.current
  end
end

# Use in a model
class Document < ApplicationRecord
  include Archivable
end
```
