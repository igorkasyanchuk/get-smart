## 📂 Create a Simple Table
Defining tables is fundamental in SQL. Use the `CREATE TABLE` statement to define columns and their data types. For example, to create a `users` table:

```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```