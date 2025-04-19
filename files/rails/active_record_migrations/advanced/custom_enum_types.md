## 🛠️ Define Custom PostgreSQL Enum Types

PostgreSQL enums offer better performance and integrity for fixed sets. Create a new enum type via `execute` and map Rails enums to it. Altering enums requires executing `ALTER TYPE` statements.

```ruby
class CreateMoodEnumAndAddToUsers < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE mood AS ENUM ('happy', 'sad', 'neutral');
    SQL
    add_column :users, :mood, :mood, default: 'neutral', null: false
  end

  def down
    remove_column :users, :mood
    execute 'DROP TYPE mood;'
  end
end
```