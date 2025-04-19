## ⚡ Dynamic Nested Forms with Stimulus and Turbo Frames
Implement real-time addition and removal of nested fields without full-page reloads by combining Turbo Frames with a Stimulus controller. The controller inserts a template for new nested items and handles removal, preserving parameter naming for strong parameters.

```erb
<!-- app/views/projects/_form.html.erb -->
<%= unified_form_with model: @project do |f| %>
  <%= f.input_field :name %>

  <turbo-frame id="tasks">
    <%= f.fields_for :tasks do |task_fields| %>
      <%= render 'task_fields', f: task_fields %>
    <% end %>
  </turbo-frame>

  <button type="button" data-controller="nested" data-action="nested#add" data-nested-target-template-id="task-template">Add Task</button>
  <%= f.submit 'Save' %>
<% end %>

<!-- app/views/projects/_task_fields.html.erb -->
<div data-nested-target="item">
  <%= f.input_field :title %>
  <button type="button" data-action="nested#remove">Remove</button>
</div>

<!-- app/javascript/controllers/nested_controller.js -->
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["item", "template"]
  add() {
    const content = document.getElementById(this.templateId).innerHTML
    this.element.querySelector('turbo-frame').insertAdjacentHTML('beforeend', content)
  }
  remove(event) {
    event.currentTarget.closest('[data-nested-target="item"]').remove()
  }
}
```

Ensure your `Project` model accepts nested attributes and configure strong parameters.