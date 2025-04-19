## 🛠 Leveraging Window Functions

Window functions let you perform calculations across sets of rows related to the current row. Use them for running totals, ranks, or moving averages directly in SQL.

```ruby
Invoice.select(
  "invoices.*, SUM(amount) OVER (PARTITION BY customer_id ORDER BY created_at) AS running_total"
)
```
Here, `running_total` is computed per customer in chronological order without additional Ruby processing.