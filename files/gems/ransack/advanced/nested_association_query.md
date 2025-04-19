## 🔍 Deeply Nested Association Queries with Joins
For performance and flexibility, explicitly join associations and reference them in predicates. This approach avoids N+1 queries and lets you filter on deeply nested relationships.

```ruby
# In a controller or service object
@q = Order.joins(customer: { address: :country })
          .ransack(
            customer_country_name_eq: 'United States',
            status_in: ['pending', 'shipped']
          )
@orders = @q.result(distinct: true)
``` 

In your view, ensure the search fields match the join path:

```erb
<%= search_form_for @q do |f| %>
  <%= f.label :customer_country_name_eq, 'Country' %>
  <%= f.text_field :customer_country_name_eq %>
  <%= f.submit 'Search' %>
<% end %>
```

This produces a single optimized SQL query with the necessary JOINs.