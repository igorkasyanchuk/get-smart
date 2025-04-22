## 🏷️ Use Column Aliases for Clarity

Aliases let you rename columns in the result set to make them more descriptive. Use the `AS` keyword (optional in many databases).

```sql
SELECT first_name AS "First Name", last_name AS "Last Name"
FROM users;
```

This query labels columns as “First Name” and “Last Name” in the output, improving readability.