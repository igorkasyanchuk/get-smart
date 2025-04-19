## 🔗 Handle Complex Nested Associations with `simple_fields_for` and Cocoon

For models with deeply nested `has_many` relationships, combine `simple_fields_for` with the Cocoon gem to dynamically add or remove child records. This approach maintains clean markup, keeps JS minimal, and ensures validations and callbacks fire correctly on both client and server.

```ruby
# app/views/articles/_form.html.erb
<%= simple_form_for @article do |f| %>
  <%= f.input :title %>

  <div id="sections">
    <%= f.simple_fields_for :sections do |section| %>
      <%= render 'section_fields', f: section %>
    <% end %>
    <%= link_to_add_association 'Add Section', f, :sections, partial: 'section_fields' %>
  </div>

  <%= f.button :submit %>
<% end %>

# app/views/articles/_section_fields.html.erb
<div class="nested-fields">
  <%= f.input :heading %>
  <%= f.input :body %>
  <%= link_to_remove_association 'Remove', f %>
</div>
```