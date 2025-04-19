## 🧙 Tip: Apply Decorators with Draper for Presentation Logic
Offload complex view logic into decorators using the Draper gem. Decorators wrap models to expose presentation-specific methods for cleaner views.

Example:

```ruby
# app/decorators/user_decorator.rb
class UserDecorator < Draper::Decorator
  delegate_all

  def formatted_join_date
    object.created_at.strftime('%B %d, %Y')
  end
end
```
```erb
<%= @user.decorate.formatted_join_date %>
```