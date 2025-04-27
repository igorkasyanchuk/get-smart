## 🚀 Create Expression & Partial Indexes for Targeted Speed
Expression indexes index computed values, and partial indexes only cover rows meeting a condition, minimizing index size. Combine for efficient lookups.

```sql
-- Index on lower-case email for case-insensitive search
CREATE INDEX idx_users_lower_email ON users ((lower(email)));

-- Partial index on active orders
CREATE INDEX idx_active_orders_date ON orders(order_date)
WHERE status = 'active';
```

Queries on `LOWER(email)` or filtering active orders automatically leverage these specialized indexes.