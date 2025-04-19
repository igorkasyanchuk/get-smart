## 🚀 Enforce Multi-Tenant Authorization with Pundit Scopes

For SaaS applications, isolating each tenant’s data at the policy scope level prevents unauthorized cross‑tenant access. By injecting the current tenant into your Pundit policies and default scopes, you ensure all queries are automatically filtered.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_current_tenant

  def set_current_tenant
    @current_tenant = Tenant.find_by!(subdomain: request.subdomain)
  end

  def pundit_user
    OpenStruct.new(user: current_user, tenant: @current_tenant)
  end
end
```

```ruby
# app/policies/application_policy.rb
class ApplicationPolicy
  attr_reader :user, :record, :tenant

  def initialize(pundit_user, record)
    @user = pundit_user.user
    @tenant = pundit_user.tenant
    @record = record
  end

  class Scope
    def resolve
      scope.where(tenant_id: tenant.id)
    end
  end
end
```

This setup enforces tenant‑based scoping globally, so every `policy_scope(Model)` call automatically filters by `tenant_id`.