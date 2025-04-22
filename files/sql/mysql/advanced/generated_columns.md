## ⚙️ Leverage Generated Columns for Computed Values
Generated columns allow you to index expressions and JSON extractions as real columns. Choose STORED for frequent lookups or VIRTUAL for space savings. This technique can accelerate filters and grouping queries without manual maintenance.

```sql
ALTER TABLE orders
ADD COLUMN total_cents INT
  GENERATED ALWAYS AS (amount * 100) STORED,
ADD INDEX idx_total_cents (total_cents);
```