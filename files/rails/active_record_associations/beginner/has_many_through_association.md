## 🔗➡️ Use `has_many :through` for Rich Join Models

When you need extra data on the join, use `has_many :through` with a join model. This offers callbacks, validations, and extra attributes.

```ruby
# app/models/appointment.rb
class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
end

# app/models/doctor.rb
class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end
```

Now `doctor.patients` returns all patients, and you can store appointment details on the join record.
