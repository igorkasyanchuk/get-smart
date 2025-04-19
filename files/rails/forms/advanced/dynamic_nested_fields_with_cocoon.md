## 🧩 Dynamic Nested Fields with Cocoon

Use the Cocoon gem to dynamically add and remove nested form fields without page reloads. Cocoon handles `has_many` associations and maintains proper indexing for Rails’ strong parameters. First, add Cocoon to your Gemfile and configure your parent form with `link_to_add_association` and `link_to_remove_association` helpers.

```ruby
# app/models/project.rb
class Project < ApplicationRecord
  has_many :tasks, inverse_of: :project
  accepts_nested_attributes_for :tasks, allow_destroy: true
end
```

```erb
<!-- app/views/projects/_form.html.erb -->
<%= form_with(model: project) do |f| %>
  <div id="tasks">
    <%= f.simple_fields_for :tasks do |task_form| %>
      <%= render 'task_fields', f: task_form %>
    <% end %>
    <%= link_to_add_association 'Add Task', f, :tasks, class: 'btn btn-sm btn-primary' %>
  </div>
  <%= f.submit %>
<% end %>
```

```erb
<!-- app/views/projects/_task_fields.html.erb -->
<div class="nested-fields">
  <%= f.input :name %>
  <%= link_to_remove_association 'Remove', f, class: 'text-danger' %>
</div>
```