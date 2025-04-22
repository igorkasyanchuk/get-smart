## 🆕 Creating a New Database

SQLite stores databases as single files. Use the `sqlite3` CLI to create a new database file by simply specifying a filename. If the file doesn't exist, SQLite will create it for you.

```bash
# Create or open a database named example.db
sqlite3 example.db

# In the sqlite> prompt, type .exit to quit
sqlite> .exit
```
