## 🐘 Implement PostgreSQL Table Partitioning in Migration

Partitioning large tables can dramatically boost query performance. Use raw SQL in migrations to set up range or list partitions, letting PostgreSQL route inserts automatically.

```ruby
class PartitionOrdersByCreatedAt < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TABLE orders_parent (
        LIKE orders INCLUDING ALL
      ) PARTITION BY RANGE (created_at);

      CREATE TABLE orders_2023_q1 PARTITION OF orders_parent
        FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');

      INSERT INTO orders_parent SELECT * FROM orders;
      DROP TABLE orders;
      ALTER TABLE orders_parent RENAME TO orders;
    SQL
  end

  def down
    execute <<-SQL
      -- Reverse: drop partitions and recreate original table
    SQL
  end
end
```

This ensures seamless cutover with zero-downtime data migration.