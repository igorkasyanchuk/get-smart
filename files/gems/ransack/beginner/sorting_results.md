## ↕️ Adding Sort Links to Results
Quickly enable column sorting using `sort_link`. Clicking the header will toggle ASC/DESC automatically.

```erb
<table>
  <thead>
    <tr>
      <th><%= sort_link(@q, :name, "Name") %></th>
      <th><%= sort_link(@q, :created_at, "Joined At") %></th>
    </tr>
  </thead>
  <tbody>
    <% @products.each do |product| %>
      <tr>
        <td><%= product.name %></td>
        <td><%= product.created_at.to_date %></td>
      </tr>
    <% end %>
  </tbody>
</table>
```

Ensure your controller uses the sorted result:

```ruby
@q = Product.ransack(params[:q])
@products = @q.result.order(@q.sorts)
```