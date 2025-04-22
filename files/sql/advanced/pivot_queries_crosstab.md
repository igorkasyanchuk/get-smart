## 📈 Transform Rows to Columns with PIVOT or Crosstab
Pivoting aggregates into columns simplifies reporting. In PostgreSQL, use the `crosstab()` function; in SQL Server, employ the `PIVOT` operator.

```sql
-- PostgreSQL using tablefunc
CREATE EXTENSION IF NOT EXISTS tablefunc;
SELECT *
FROM crosstab(
  'SELECT region, product, sales FROM sales_data ORDER BY 1,2',
  'SELECT DISTINCT product FROM sales_data ORDER BY 1'
) AS ct(region text, widget numeric, gadget numeric, doodad numeric);
```

This yields a region‐by‐product sales matrix without manual CASE statements.