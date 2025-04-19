## 🏛️ Custom Database Adapters for Multi-Tenancy
Implement a schema-based multi-tenant strategy by overriding `establish_connection` in ApplicationRecord. Dynamically switch Postgres schemas per request to isolate tenant data.

```ruby
class TenantRecord < ApplicationRecord
  self.abstract_class = true

  def self.connect_to(tenant)
    config = Rails.configuration.database_configuration[Rails.env].deep_dup
    config['schema_search_path'] = "public,#{tenant.schema_name}"
    establish_connection(config)
  end
end

# In ApplicationController
around_action do |_, action|
  TenantRecord.connect_to(current_tenant)
  action.call
ensure
  TenantRecord.clear_active_connections!
end
```