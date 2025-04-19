## 🎣 Leveraging `capture` for Block Helpers

`capture` allows you to grab the output of a block in a helper and use it later. This is useful for creating wrappers or storing markup in variables.

```ruby
module ApplicationHelper
  def card(title, &block)
    body = capture(&block)
    content_tag :div, class: 'card' do
      concat(content_tag(:h3, title, class: 'card-title'))
      concat(content_tag(:div, body, class: 'card-body'))
    end
  end
end
```

And in your view:

```erb
<%= card("User Info") do %>
  <p>Name: <%= @user.name %></p>
  <p>Email: <%= @user.email %></p>
<% end %>
```
