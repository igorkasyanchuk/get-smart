## 🏎 Ensuring Uniqueness with `distinct`

Use `distinct` to remove duplicate rows when joining tables or selecting specific columns. It maps directly to `SELECT DISTINCT` in SQL, ensuring unique results.

```ruby
# Unique list of category names from products
categories = Product.joins(:category)
                    .distinct
                    .pluck('categories.name')
```