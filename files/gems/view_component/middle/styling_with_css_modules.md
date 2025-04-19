## 🎨 Styling with CSS Modules

ViewComponent supports CSS modules for scoped styling. Place a `.scss` file alongside your component with the same name plus `.module.scss`.

```scss
/* app/components/card_component.module.scss */
.card {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 16px;
}

.card__header {
  font-weight: bold;
  margin-bottom: 8px;
}
```

```ruby
# app/components/card_component.rb
class CardComponent < ViewComponent::Base
  def initialize; end
  def stylesheet
    "card_component"
  end
end
```

```erb
<%= render(CardComponent.new) do |c| %>
  <div class="card__header">Hello</div>
  <div class="card__body">World</div>
<% end %>
```