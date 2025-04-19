## 🧩 Tip: Build Reusable UI with ViewComponent
Adopt the ViewComponent pattern to encapsulate view logic and markup in Ruby objects for better testability and composability. Define slots, parameters, and inline templates within the component class.

Example:

```ruby
# app/components/alert_component.rb
class AlertComponent < ViewComponent::Base
  renders_one :title
  renders_many :messages

  def initialize(type: :info)
    @type = type
  end
end
```
```erb
<%# app/components/alert_component.html.erb %>
<div class="alert alert-<%= @type %>">
  <h4><%= title %></h4>
  <ul>
    <% messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
  </ul>
</div>
```