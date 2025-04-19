## 🎯 Use Partitioned Tables in Models
For massive datasets (logs, events), partition your table at the database level and map the parent table to a Rails model. Use database triggers or inheritance; you can then route inserts to the correct partition transparently.

```ruby
# Migration example:
execute <<-SQL
CREATE TABLE events (
  id serial primary key,
  occurred_at timestamptz not null,
  data jsonb
) PARTITION BY RANGE (occurred_at);
CREATE TABLE events_2024 PARTITION OF events
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
SQL

class Event < ApplicationRecord
  self.abstract_class = true
  self.table_name = 'events'
end
```

Now point your queries to `Event`, and Postgres handles routing to the right partition for performance.