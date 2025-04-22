## 🔔 PL/pgSQL Triggers for Audit Logging

Triggers let you execute procedural code automatically on table events. Use PL/pgSQL functions to record changes in an audit table for inserts, updates, and deletes.

```sql
-- Create audit table
CREATE TABLE audit_log (
  id serial PRIMARY KEY,
  table_name text,
  operation text,
  changed_at timestamptz DEFAULT NOW(),
  data jsonb
);

-- Trigger function
CREATE OR REPLACE FUNCTION audit_changes() RETURNS trigger AS $$
BEGIN
  INSERT INTO audit_log(table_name, operation, data)
  VALUES (TG_TABLE_NAME, TG_OP, to_jsonb(NEW));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Attach trigger to target table
CREATE TRIGGER user_audit
  AFTER INSERT OR UPDATE OR DELETE
  ON users
  FOR EACH ROW EXECUTE FUNCTION audit_changes();
```
