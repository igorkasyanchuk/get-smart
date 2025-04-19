## 🧩 Use Arel for Complex Subqueries
When you need to build highly dynamic or database‑agnostic queries inside a model, leverage Arel to compose queries safely. This approach ensures your subqueries or joins are escaped properly and can be manipulated programmatically.

```ruby
class Order < ApplicationRecord
  # Find customers whose last order was above a threshold
  def self.high_value_customers(amount)
    orders = arel_table
    subquery = orders
      .project(orders[:customer_id])
      .where(orders[:total_cents].gt(amount))
      .order(orders[:created_at].desc)
      .take(1)

    where(id: Arel::Nodes::SqlLiteral.new(subquery.to_sql))
  end
end
```

This constructs the subquery in pure Arel and then injects its SQL safely into ActiveRecord's `where` clause.