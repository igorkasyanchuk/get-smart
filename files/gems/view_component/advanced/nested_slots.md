## 🧩 Leveraging Nested Slots for Flexible Layouts
By using multiple named and collection slots, you can build highly customizable components that accept various child parts. This approach helps you avoid bloated initializer arguments and keeps templates clear by delegating structure to the component.

```ruby
# app/components/card_component.rb
class CardComponent < ViewComponent::Base
  renders_one :header, ->(title:) { HeaderComponent.new(title: title) }
  renders_many :items
  renders_one :footer
end
```

```erb
<%= render(CardComponent.new) do |c| %>
  <% c.header(title: "User Profile") %>
  <% c.items do |item| %>
    <%= item.call(UserComponent.new(user: current_user)) %>
  <% end %>
  <% c.footer do %>
    <small>Last updated at <%= Time.current %></small>
  <% end %>
<% end %>
```