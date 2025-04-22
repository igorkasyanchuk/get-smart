## 🔄 Working with Transactions

Wrap multiple operations in a transaction to ensure atomicity. Either all statements succeed, or none are applied if an error occurs.

```sql
BEGIN TRANSACTION;
  INSERT INTO users (name, email) VALUES ('Eve', 'eve@example.com');
  UPDATE users SET email = 'eve@newdomain.com' WHERE name = 'Eve';
COMMIT;

-- If something goes wrong, roll back
ROLLBACK;
```
