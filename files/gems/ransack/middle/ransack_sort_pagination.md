## ↕️ Combining Sorting and Pagination

Integrating Ransack's `sort_link` with pagination gems like Kaminari or WillPaginate helps maintain sort state across pages. Use `sort_link` in table headers and pass `params: request.query_parameters` to your pagination helper to preserve filter & sort params.

```erb
<table>
  <thead>
    <tr>
      <th><%= sort_link(@q, :name, "Name") %></th>
      <th><%= sort_link(@q, :created_at, "Created At") %></th>
    </tr>
  </thead>
  <tbody>
    <% @users.each do |user| %>
      <tr>
        <td><%= user.name %></td>
        <td><%= user.created_at.to_date %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<%= paginate @users, params: request.query_parameters %>
```

```ruby
# In controller
@q = User.ransack(params[:q])
@users = @q.result.order(:name).page(params[:page]).per(10)
```

This approach ensures that when you click on a page link, your current search filters and sort order remain intact.
