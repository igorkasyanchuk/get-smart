## ⚙️ Polymorphic Geocoding Across Multiple Models

When you have different models sharing address data (e.g., User and Event), a polymorphic `Address` model prevents duplication. Set up `Address` to geocode any addressable model:

```ruby
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_full_address?
end

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :addressable_type
      t.bigint :addressable_id
      t.float :latitude
      t.float :longitude
      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
```

Then in your models:

```ruby
class User < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end

class Event < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end
```

Now both `User` and `Event` will geocode their addresses automatically, and you can run combined queries on the `addresses` table for location‑based features.