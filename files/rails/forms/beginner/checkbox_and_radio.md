## ☑️ Using check boxes and radio buttons
For boolean or exclusive choices, use `check_box` and `radio_button`. `check_box` creates a checkbox for true/false, while `radio_button` groups options by attribute name. Add labels for clarity.

```ruby
<%= form_with model: @subscription, local: true do |f| %>
  <%= f.label :newsletter, "Subscribe to newsletter" %>
  <%= f.check_box :newsletter %>

  <%= f.label :plan_basic, "Basic" %>
  <%= f.radio_button :plan, "basic" %>

  <%= f.label :plan_premium, "Premium" %>
  <%= f.radio_button :plan, "premium" %>
<% end %>
```
