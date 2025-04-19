## 🛠️ Implement Reversible Data Migrations

For data migrations that should be reversible, use the `reversible` helper to define up and down data changes. This ensures that rolling back also reverts data transformations predictably. It’s ideal for cleaning or migrating columns without leaving stale data.

```ruby
class NormalizeUserNames < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        User.find_each { |u| u.update_columns(name: u.name.strip.titleize) }
      end

      dir.down do
        User.find_each { |u| u.update_columns(name: u.name.downcase) }
      end
    end
  end
end
```