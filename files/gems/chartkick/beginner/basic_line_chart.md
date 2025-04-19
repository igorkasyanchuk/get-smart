## 📈 Create a Basic Line Chart

Line charts are perfect for showing trends over time, such as sign-ups per day. In your controller, prepare a hash of grouped data, then call `line_chart` in the view for an instant visualization.

```ruby
# app/controllers/users_controller.rb
def index
  @users_by_day = User.group_by_day(:created_at).count
end
```

```erb
<!-- app/views/users/index.html.erb -->
<%= line_chart @users_by_day, xtitle: "Date", ytitle: "Users Signed Up" %>
```