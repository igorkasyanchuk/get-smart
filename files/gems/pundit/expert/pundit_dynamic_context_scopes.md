## 🏗️ Construct Dynamic Policy Scopes with Context

When you need to scope records based on both user attributes and runtime parameters (e.g., tenant IDs or feature flags), pass an extra context hash into your policy scope. Override the `initialize` signature in your `Scope` class to accept and store this context, then use it in `resolve` to build complex SQL queries without N+1 pitfalls.

```ruby
# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope, :context

    # Accept a context hash alongside user and scope
    def initialize(user, scope, context = {})
      @user    = user
      @scope   = scope
      @context = context
    end

    def resolve
      records = scope.all

      # Filter by tenant if provided in context
      records = records.where(tenant_id: context[:tenant_id]) if context[:tenant_id]

      # Public posts only for non-admins
      records = records.where(published: true) unless user.admin?

      # Eager‑load associations to avoid N+1
      records = records.includes(:comments, :author)

      records
    end
  end
end

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Pundit

  # Extend policy_scope to accept context
  def policy_scope(scope, context: {})
    Pundit.policy_scope!(pundit_user, scope, context)
  end
end

# Usage in controller
class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post, context: { tenant_id: current_tenant.id })
  end
end
```
