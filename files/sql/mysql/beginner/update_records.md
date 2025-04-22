## 🔄 Updating Records with UPDATE
`UPDATE` modifies existing rows. Always include a `WHERE` clause to avoid changing all rows unintentionally.

```sql
-- Deactivate a user by ID
UPDATE users
SET active = 0
WHERE id = 42;

-- Increase price of all accessories by 10%
UPDATE products
SET price = price * 1.10
WHERE category = 'Accessory';
```