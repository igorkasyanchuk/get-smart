## 🧩 Building nested forms with `fields_for`
When working with associated models, like a blog with comments, use `fields_for` inside your main form. This allows creating or editing child records alongside the parent. Remember to accept nested attributes in the parent model.

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments
end

# in view:
<%= form_with model: @post, local: true do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.fields_for :comments do |c| %>
    <%= c.label :body, "Comment" %>
    <%= c.text_area :body %>
  <% end %>

  <%= f.submit "Save Post with Comments" %>
<% end %>
```
