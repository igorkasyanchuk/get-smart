## 🔑 Implement Role-Based Access in Policies

Use Pundit policies to enforce role checks cleanly. Define helper methods like `admin?` or `editor?` and reference them in each action method to keep your controllers thin and policies expressive.

```ruby
class UserPolicy < ApplicationPolicy
  def show?
    user.admin? || record.id == user.id
  end

  def update?
    user.admin? || (user.editor? && record.section == user.section)
  end

  def destroy?
    user.admin?
  end
end
```