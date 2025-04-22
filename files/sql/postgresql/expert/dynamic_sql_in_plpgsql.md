## 🎯 Build Dynamic Queries Safely in PL/pgSQL

When you need flexible table or column names at runtime, use `format()`, `quote_ident()`, and `quote_literal()` in PL/pgSQL to construct safe dynamic SQL, avoiding SQL injection while retaining performance.

```sql
CREATE OR REPLACE FUNCTION search_dynamic(
  tbl text, col text, val text
) RETURNS SETOF RECORD AS $$
BEGIN
  RETURN QUERY EXECUTE format(
    'SELECT * FROM %I WHERE %I = %L',
    tbl, col, val
  );
END;
$$ LANGUAGE plpgsql;

-- Usage (return type must be defined by caller)
SELECT * FROM search_dynamic('users', 'email', 'alice@example.com') AS t(id int, email text);
```