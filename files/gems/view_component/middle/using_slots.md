## ✨ Using Slots for Dynamic Content

Slots allow you to define flexible content areas within your component, making it easier to compose UI elements. You can declare multiple slots and provide default content if none is supplied by the caller.

```ruby
# app/components/card_component.rb
class CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer, -> { tag.div("Default Footer", class: "footer") }
end
```

```erb
<%= render(CardComponent.new) do |c| %>
  <% c.header do %>
    <h2>Title Goes Here</h2>
  <% end %>
  <% c.body do %>
    <p>This is the body of the card.</p>
  <% end %>
<% end %>
```