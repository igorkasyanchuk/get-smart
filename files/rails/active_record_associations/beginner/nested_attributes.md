## 📝 Accept Nested Attributes for Forms

Allow nested attributes on parent models to create or update children in one form. Enable with `accepts_nested_attributes_for`.

```ruby
# app/models/author.rb
class Author < ApplicationRecord
  has_many :books
  accepts_nested_attributes_for :books
end
```

In your form, use fields_for:

```erb
<%= form_for @author do |f| %>
  <%= f.text_field :name %>
  <%= f.fields_for :books do |b| %>
    <%= b.text_field :title %>
  <% end %>
<% end %>
```
