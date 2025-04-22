## ➕ Inserting Data with INSERT INTO
`INSERT INTO` adds new rows to a table. Specify the columns and values to ensure data integrity.

```sql
-- Insert a single user
INSERT INTO users (name, email, active)
VALUES ('Alice', 'alice@example.com', 1);

-- Insert multiple products
INSERT INTO products (name, price)
VALUES
  ('Phone', 699.99),
  ('Laptop', 1299.50);
```