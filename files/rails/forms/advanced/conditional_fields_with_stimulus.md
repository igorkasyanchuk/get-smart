## ⚙️ Conditional Fields with Stimulus.js

Use Stimulus controllers to toggle form fields based on user interactions in real time. Stimulus keeps your JavaScript lightweight and scoped. Define a controller that shows or hides fieldsets when a select box changes.

```javascript
// app/javascript/controllers/conditional_fields_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["extraInfo"]

  connect() {
    this.toggle()
  }

  toggle() {
    const show = this.element.value === 'yes'
    this.extraInfoTargets.forEach(el => el.hidden = !show)
  }
}
```

```erb
<!-- app/views/orders/_form.html.erb -->
<%= form_with(model: @order, data: { controller: 'conditional-fields', action: 'change->conditional-fields#toggle' }) do |f| %>
  <%= f.select :gift_wrap, [['No', 'no'], ['Yes', 'yes']], {}, data: { target: 'conditional-fields.extraInfo' } %>

  <div data-target="conditional-fields.extraInfo">
    <%= f.text_area :gift_message, placeholder: 'Enter gift message' %>
  </div>

  <%= f.submit %>
<% end %>
```