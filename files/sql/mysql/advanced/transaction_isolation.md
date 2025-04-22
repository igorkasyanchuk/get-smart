## 🔒 Fine-Tune Locking with Custom Transaction Isolation Levels
Choosing the right isolation level balances consistency and concurrency. SERIALIZABLE prevents phantom reads but can increase locking waits, while READ COMMITTED reduces them. Use SELECT ... FOR UPDATE or LOCK IN SHARE MODE to explicitly lock rows when needed.

```sql
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM inventory WHERE product_id = 42 FOR UPDATE;
UPDATE inventory SET stock = stock - 1 WHERE product_id = 42;
COMMIT;
```