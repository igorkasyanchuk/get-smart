## 🔲 Tip: Structure Views with the Cells Gem Architecture
Leverage the Cells gem to encapsulate view logic and templates in cell classes, enabling unit testing and reuse. Each cell handles its own rendering and can accept state.

Example:

```ruby
class ProfileCell < Cell::ViewModel
  property :user

  def show
    render
  end
end
```
```erb
<%# app/cells/profile_cell/show.html.erb %>
<div class="profile">
  <h2><%= user.name %></h2>
  <p><%= user.bio %></p>
</div>
```
```erb
<%= cell(:profile, user: @user).call %>
```