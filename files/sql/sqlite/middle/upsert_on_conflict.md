## ➕ Performing UPSERTs Using ON CONFLICT

The `ON CONFLICT` clause enables atomic insert-or-update operations. Specify target columns and a DO UPDATE action to merge data without extra queries.

```sql
CREATE TABLE inventory (
  product_id INTEGER PRIMARY KEY,
  stock INTEGER
);

INSERT INTO inventory(product_id, stock)
VALUES(101, 5)
ON CONFLICT(product_id)
DO UPDATE SET stock = stock + excluded.stock;
```