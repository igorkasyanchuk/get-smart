## ⚙️ Create Partitioned Tables

Leverage PostgreSQL table partitioning to manage large datasets by range, list, or hash. Use `execute` in migrations to define partition schemes and create child tables. This improves performance and maintenance for time-series or massive tables.

```ruby
class PartitionEventsByDate < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TABLE events (
        id SERIAL PRIMARY KEY,
        occurred_at TIMESTAMP NOT NULL,
        data JSONB
      ) PARTITION BY RANGE (occurred_at);
    SQL
    execute <<-SQL
      CREATE TABLE events_2023 PARTITION OF events
      FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
    SQL
  end

  def down
    execute 'DROP TABLE events_2023;'
    execute 'DROP TABLE events;'
  end
end
```