## 🧵 Using REGEXP for Pattern Matching
`REGEXP` (or `RLIKE`) provides powerful pattern matching beyond simple `LIKE`. It supports character classes, quantifiers, and anchors. Remember that regex queries can be slow on large tables—combine with indexed columns when possible.

```sql
-- Names starting with A or B
SELECT name FROM products
WHERE name REGEXP '^[AB]';

-- Email validation example
SELECT email FROM users
WHERE email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
```
