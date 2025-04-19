## ⚙️ Create a Custom Migration Base Class for Shared Logic

For projects with recurring migration patterns, factor common methods into a base class. Inherit from it to reduce duplication and enforce best practices.

```ruby
# lib/migration_helpers.rb
module MigrationHelpers
  def safely_add_column(table, column, type, **options)
    disable_ddl_transaction!
    add_column table, column, type, **options
  end
end

# db/migrate/20230901000000_add_metadata_to_users.rb
class AddMetadataToUsers < ActiveRecord::Migration[6.1]
  include MigrationHelpers

  def change
    safely_add_column :users, :metadata, :jsonb, default: {}
  end
end
```

This approach centralizes custom behaviors, ensuring consistency across your migrations.