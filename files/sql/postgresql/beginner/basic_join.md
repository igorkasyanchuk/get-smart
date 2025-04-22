## 🔗 Perform a Basic JOIN
Combine rows from multiple tables using `JOIN`. For example, if you have a `posts` table related to `users`:

```sql
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  content TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT users.name, posts.content
FROM posts
JOIN users ON posts.user_id = users.id;
```