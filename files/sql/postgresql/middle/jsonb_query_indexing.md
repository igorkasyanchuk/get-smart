## 🗄️ Efficient JSONB Querying and Indexing

PostgreSQL’s JSONB type supports indexing and powerful querying with operators. Create GIN indexes to speed up containment checks and use `->>` and `@>` for extraction and filtering.

```sql
-- Create a GIN index on the data column
CREATE INDEX idx_products_data ON products USING GIN (data jsonb);

-- Query products where data contains {"color":"red"}
SELECT id, data->>'name' AS name
FROM products
WHERE data @> '{"color": "red"}';
```
