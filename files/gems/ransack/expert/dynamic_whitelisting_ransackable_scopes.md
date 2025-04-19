## 🔒 Secure Dynamic Scopes and Attributes with Ransackable Whitelisting

Protect your search surfaces by dynamically whitelisting only safe attributes and scopes based on the current user’s role. Override `ransackable_attributes` and `ransackable_scopes` to prevent injection of unintended filters in multi-tenant or admin contexts.

```ruby
# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.ransackable_attributes(auth_object = nil)
    base = %w[id name created_at]
    # allow email and role filtering only for admins
    base += %w[email role] if auth_object&.admin?
    base
  end

  def self.ransackable_scopes(auth_object = nil)
    scopes = []
    # only superadmins get to scope by organization
    scopes << :by_organization if auth_object&.superadmin?
    scopes
  end
end

# app/models/user.rb
class User < ApplicationRecord
  scope :by_organization, ->(org_id) { where(organization_id: org_id) }
end
```

Now in your controller you can pass `current_user` as the auth object to lock down filters:

```ruby
@q = User.ransack(params[:q], auth_object: current_user)
```