## 📊 Leverage Window Functions for Running Totals and Rankings
Window functions allow calculations across a set of rows related to the current row without collapsing the result set. Use `OVER` clauses to compute running totals, rankings, or moving averages.

```sql
SELECT
  order_id,
  order_date,
  amount,
  SUM(amount) OVER (ORDER BY order_date) AS running_total,
  RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rank_by_amount
FROM orders;
```