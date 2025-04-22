## 🔗 Aggregating Strings with GROUP_CONCAT
`GROUP_CONCAT` concatenates non-null values from a group into a single string. You can set `SEPARATOR` and limit the maximum length via `group_concat_max_len`. Useful for generating comma-separated lists of related items.

```sql
SELECT
  o.order_id,
  GROUP_CONCAT(p.name ORDER BY p.name SEPARATOR ', ') AS products
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY o.order_id;
```
