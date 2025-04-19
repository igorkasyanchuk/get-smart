## 📅 Using date and time selectors
Rails provides `date_select`, `time_select`, and `datetime_select` for date/time inputs. They generate separate dropdowns for each component, avoiding format issues. Good for scheduling features.

```ruby
<%= form_with model: @event, local: true do |f| %>
  <%= f.label :start_date, "Start Date" %>
  <%= f.date_select :start_date %>

  <%= f.label :start_time, "Start Time" %>
  <%= f.time_select :start_time, minute_step: 15 %>
<% end %>
```
