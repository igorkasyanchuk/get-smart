## 🔄 Pivot and Unpivot with crosstab()
Transform rows into columns (pivot) or vice versa (unpivot) using the `crosstab()` extension for reporting queries.

```sql
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM crosstab(
  $$
  SELECT product_category, month, SUM(amount)
  FROM sales
  GROUP BY product_category, month
  ORDER BY 1,2
  $$,
  $$VALUES ('2024-01'),('2024-02'),('2024-03')$$
) AS ct(
  category TEXT,
  jan NUMERIC,
  feb NUMERIC,
  mar NUMERIC
);
```

This outputs one row per category with monthly columns. For unpivot-like operations, use `UNION ALL` or JSON functions depending on complexity.