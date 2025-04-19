## 🧬 STI Associations with Default Scopes
Combine Single Table Inheritance (STI) with associations to share tables but vary behavior. Use default scopes or class-level `primary_key` overrides to link STI subclasses to the same join model. This pattern streamlines related records across variants.

```ruby
class Event < ApplicationRecord
  # STI base class
  has_many :attendees, foreign_key: :event_id
end

class OnlineEvent < Event
  default_scope { where(event_type: 'online') }
end

class OfflineEvent < Event
  default_scope { where(event_type: 'offline') }
end

class Attendee < ApplicationRecord
  belongs_to :event
  # You can still fetch only OnlineEvent attendees
  scope :online_only, -> { joins(:event).merge(OnlineEvent.all) }
end
```