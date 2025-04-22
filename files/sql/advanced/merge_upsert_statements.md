## ⚡ Perform Upserts with MERGE or ON CONFLICT
Upsert operations merge insert and update logic in one atomic statement. In PostgreSQL, use `INSERT … ON CONFLICT`, while in SQL Server or Oracle, use `MERGE`.

```sql
-- PostgreSQL
INSERT INTO products(id, name, stock)
VALUES (1, 'Widget', 100)
ON CONFLICT (id) DO UPDATE
  SET stock = products.stock + EXCLUDED.stock;
```

```sql
-- SQL Server
MERGE INTO products AS target
USING (VALUES (1, 'Widget', 100)) AS src(id, name, stock)
  ON target.id = src.id
WHEN MATCHED THEN UPDATE SET target.stock = target.stock + src.stock
WHEN NOT MATCHED THEN INSERT (id, name, stock) VALUES (src.id, src.name, src.stock);
```