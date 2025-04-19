## 💬 Flash Messages

Flash messages ring a bell when you need to display one-time notices or alerts. Use `flash[:notice]` or `flash[:alert]` before redirecting. They persist for exactly one request, then disappear.

```ruby
class ArticlesController < ApplicationController
  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path, notice: 'Article deleted successfully.'
  end
end
```

```erb
<!-- app/views/layouts/application.html.erb -->
<% if flash.any? %>
  <div id="flash">
    <% flash.each do |key, message| %>
      <p class="<%= key %>"><%= message %></p>
    <% end %>
  </div>
<% end %>
```