## 🔄 Dynamic Policy Scopes for Role-Based Query Optimization
When you have complex multi‑tenant or role‑based access, you can build dynamic scopes by chaining sub‑scopes and leveraging metaprogramming. This approach avoids duplicating `resolve` logic for each role and keeps your database queries efficient.

First, define individual sub‑scopes on your policy's `Scope` class:

```ruby
class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      base = Pundit.policy_scope!(user, base_record)
      chain_scopes(base)
    end

    private

    def chain_scopes(scope)
      scopes = []
      scopes << scope.where(organization_id: user.organization_id)
      scopes << scope.where(public: true) if user.guest?
      scopes << scope.all if user.admin?

      # Combine all scopes using OR
      scopes.reduce { |combined, s| combined.or(s) }
    end
  end
end
```

Then call it in your controller to fetch only authorized projects:

```ruby
class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project)
  end
end
```

This pattern scales when you add new roles or sub‑scopes—just add methods in `chain_scopes` without touching the controller.