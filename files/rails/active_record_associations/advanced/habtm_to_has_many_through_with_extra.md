## 👥 HABTM via Join Model for Extra Attributes
Migrate from `has_and_belongs_to_many` to `has_many :through` when you need to store additional metadata on the join. This unlocks validations, callbacks, and custom methods on the join model, giving you full control over the relationship.

```ruby
# Before: simple HABTM
class Patient < ApplicationRecord
  has_and_belongs_to_many :doctors
end

# After: join model with extra data
class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :scheduled_at, presence: true
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
end

class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end
```