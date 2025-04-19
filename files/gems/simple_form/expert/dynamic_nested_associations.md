## 🔄 Handling Deeply Nested Dynamic Associations with Stimulus and Cocoon

Expert Rails apps often require adding/removing nested association records on the fly. Combine SimpleForm’s `fields_for`, the Cocoon gem, and Stimulus to manage complex nested levels seamlessly.

1. Define your associations (e.g., Survey → Sections → Questions).

2. In your form view, nest `fields_for` and include Cocoon links:

```erb
<%= simple_form_for @survey do |f| %>
  <div id="sections">
    <%= f.simple_fields_for :sections do |section_form| %>
      <%= render 'section_fields', f: section_form %>
    <% end %>
    <%= link_to_add_association 'Add Section', f, :sections, class: 'btn btn-outline-primary', data: { controller: 'nested', action: 'nested#add' } %>
  </div>
  <%= f.submit %>
<% end %>
```

3. In `_section_fields.html.erb`, nest questions:

```erb
<div class="nested-fields" data-controller="nested">
  <%= f.input :title %>
  <div class="questions">
    <%= f.simple_fields_for :questions do |qf| %>
      <%= render 'question_fields', f: qf %>
    <% end %>
    <%= link_to_add_association 'Add Question', f, :questions, data: { action: 'nested#add' } %>
  </div>
  <%= link_to_remove_association 'Remove Section', f, class: 'text-danger', data: { action: 'nested#remove' } %>
</div>
```

4. Use a Stimulus controller (`app/javascript/controllers/nested_controller.js`) to scope and initialize new nodes:

```js
import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  add(event) {
    // Cocoon injects HTML automatically; hook any JS init here
  }
  remove(event) {
    // Optional: confirm or animation before removal
  }
}
```

This setup scales to unlimited levels of nesting while keeping your SimpleForm templates DRY and your JavaScript organized.