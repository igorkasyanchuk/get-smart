## 🎨 Dynamic Slots and Component Composition
Architect complex UIs by defining dynamic slots that accept hashes, procs, or nested components. This enables theming engines and conditional rendering without branching inside your base component.

```ruby
# app/components/card_component.rb
class CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  def initialize(theme: :light)
    @theme = theme
  end

  def call
    content_tag :div, class: "card card-#{@theme}" do
      safe_join([header, body, footer].compact)
    end
  end
end

# Usage in view:
<%= render CardComponent.new(theme: :dark) do |c| %>
  <% c.header { content_tag(:h3, "Title") } %>
  <% c.body   { "Detailed description with <strong>HTML</strong>".html_safe } %>
  <% c.footer { link_to "Learn more", "/docs", class: "btn" } %>
<% end %>
```