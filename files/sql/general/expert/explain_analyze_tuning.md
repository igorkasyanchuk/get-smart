## 🧠 EXPLAIN ANALYZE for Query Plan Tuning
Combine `EXPLAIN ANALYZE` with `BUFFERS` to identify CPU, I/O bottlenecks and index usage in complex queries.

```sql
EXPLAIN (ANALYZE, BUFFERS, FORMAT JSON)
SELECT p.name, SUM(s.amount) AS total_sales
FROM products p
JOIN sales s ON s.product_id = p.id
WHERE s.sale_date >= '2024-01-01'
GROUP BY p.name
ORDER BY total_sales DESC;
```

Inspect the JSON output to find sequential scans, high buffer read counts, or expensive hash joins. Adjust indexes or rewrite joins based on hotspots.