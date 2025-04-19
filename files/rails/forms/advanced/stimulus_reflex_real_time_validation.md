## ⚡ Real-time Validation with StimulusReflex

Integrate StimulusReflex for server-rendered, real-time form validations without full page reloads. Reflex actions trigger on input changes, validate server-side, and update only error messages.

```ruby
# app/reflexes/form_reflex.rb
class FormReflex < ApplicationReflex
  def validate
    element = element.dataset[:attribute]
    value = element.value
    @record = User.new(element => value)
    @record.valid?
  end
end
```

```erb
<!-- app/views/users/_form.html.erb -->
<%= form_with model: @user, data: { reflex: 'change->FormReflex#validate' } do |f| %>
  <%= f.text_field :username %>
  <div id="username_errors"><%= @user.errors[:username].join(', ') %></div>
  <%= f.submit %>
<% end %>
```