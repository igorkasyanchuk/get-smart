## 🔧 Change Column Type with Data Migration

When changing a column's type, you often need to transform existing data. First add a temporary column, backfill it, then swap names to avoid downtime.

```ruby
class ChangeAgeToBirthdateInProfiles < ActiveRecord::Migration[6.1]
  def up
    add_column :profiles, :birthdate, :date
    Profile.reset_column_information
    Profile.find_each do |p|
      p.update_column(:birthdate, Date.today - p.age.years) if p.age
    end
    remove_column :profiles, :age
  end

  def down
    add_column :profiles, :age, :integer
    Profile.reset_column_information
    Profile.find_each do |p|
      p.update_column(:age, Date.today.year - p.birthdate.year) if p.birthdate
    end
    remove_column :profiles, :birthdate
  end
end
```
