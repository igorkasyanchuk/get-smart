## ⚖️ Write a Reversible Migration

For complex operations (like executing raw SQL), wrap them in `reversible` so Rails knows how to undo changes. This ensures you can roll back safely.

```ruby
# db/migrate/20230109090909_add_uuid_extension.rb
class AddUuidExtension < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up   { execute "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"" }
      dir.down { execute "DROP EXTENSION IF EXISTS \"uuid-ossp\"" }
    end
  end
end
```