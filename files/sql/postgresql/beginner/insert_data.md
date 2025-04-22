## 📝 Insert Data into a Table
Use the `INSERT` statement to add records. You can specify columns explicitly or rely on defaults:

```sql
INSERT INTO users (name, email)
VALUES ('Alice', 'alice@example.com');

-- Relying on default timestamp
INSERT INTO users (name, email)
VALUES ('Bob', 'bob@example.com');
```