## 🧩 Using Slots for Flexible Content Insertion

Slots let you pass blocks of markup or other components into specific regions of your component. This pattern is great for building cards, modals, or list items with customizable parts.

```ruby
# app/components/card_component.rb
class CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
end
```

```erb
<!-- Usage in a view -->
<%= render CardComponent.new do |c| %>
  <% c.header do %>
    <h2>Card Title</h2>
  <% end %>

  <% c.body do %>
    <p>This is the card body content.</p>
  <% end %>
<% end %>
```