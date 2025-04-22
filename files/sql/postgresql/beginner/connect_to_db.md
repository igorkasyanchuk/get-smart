## 🔌 Connect to PostgreSQL Database
To start using PostgreSQL, install the `psql` client and connect to your database. You can log in with your username and database name by running:

```sql
psql -U your_username -d your_database
```

If you’re running on localhost with default settings, you can omit the `-U` flag:

```sql
psql your_database
```