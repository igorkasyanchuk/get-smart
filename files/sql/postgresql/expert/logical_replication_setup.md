## 🧠 Configure Logical Replication with Publications & Subscriptions

Logical replication allows selective table-level replication with minimal downtime. Define publications on the primary and subscriptions on replicas, and manage replication slots to control retention.

```sql
-- On publisher
CREATE PUBLICATION my_pub FOR TABLE users, orders;

-- On subscriber
CREATE SUBSCRIPTION my_sub
  CONNECTION 'host=primary_host dbname=app_db user=replicator password=secret'
  PUBLICATION my_pub;

-- Refresh in case of schema changes
ALTER SUBSCRIPTION my_sub REFRESH PUBLICATION;
```