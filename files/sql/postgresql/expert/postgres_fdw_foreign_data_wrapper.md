## ⚙️ Integrate Remote Databases with postgres_fdw

The `postgres_fdw` extension lets you query remote PostgreSQL instances as if they were local tables. Tune `fetch_size` and push-down capabilities to minimize data transfer and leverage remote indexes.

```sql
-- Load FDW and define server
CREATE EXTENSION IF NOT EXISTS postgres_fdw;
CREATE SERVER sales_srv
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'remote.host', dbname 'sales_db', port '5432');

-- Set fetch size for efficient batching
ALTER SERVER sales_srv OPTIONS (ADD fetch_size '500');

-- Import and query
IMPORT FOREIGN SCHEMA public
  FROM SERVER sales_srv INTO foreign_schema;
SELECT * FROM foreign_schema.orders WHERE amount > 1000;
```