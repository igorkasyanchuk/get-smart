## 🏢 Multi-Tenant Authentication with Devise and Apartment
Scale Devise to support multiple tenants by dynamically scoping the connection via subdomain or header before authentication. Use the `Apartment` gem to switch schemas and override `current_tenant` in `ApplicationController`. Ensure Devise looks in the correct schema for each request.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_tenant

  private

  def set_tenant
    tenant_name = request.subdomain.presence || 'public'
    Apartment::Tenant.switch!(tenant_name)
  end
end

# config/routes.rb
constraints(SubdomainConstraint) do
  devise_for :users, controllers: { sessions: 'users/sessions' }
end

# lib/subdomain_constraint.rb
class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end
```