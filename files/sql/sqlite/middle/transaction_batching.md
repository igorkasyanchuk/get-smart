## 🚀 Batch Operations under a Single Transaction

Wrapping multiple statements in a single transaction can dramatically improve write performance. Use `BEGIN ... COMMIT` to reduce journaling overhead and ensure atomicity.

```sql
BEGIN TRANSACTION;

INSERT INTO logs(message) VALUES ('Start batch');
UPDATE users SET status = 'active' WHERE last_login > date('now','-7 days');
DELETE FROM sessions WHERE expires < datetime('now');

COMMIT;
```