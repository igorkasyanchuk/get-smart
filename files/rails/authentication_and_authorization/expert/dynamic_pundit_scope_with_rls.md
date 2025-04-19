## 🛡️ Leverage Pundit Scopes with Postgres Row-Level Security

Combining Pundit’s `Scope` objects with Postgres RLS pushes authorization logic into the database, eliminating N+1 policy checks and preventing accidental bypasses. You can define RLS policies that mirror your Pundit scopes, then use a minimal scope in Ruby to apply any dynamic filters.

```sql
-- db/migrate/20240101000000_add_rls_to_projects.rb
enable_extension 'pgcrypto';

enable_row_level_security 'projects';

CREATE POLICY user_projects_policy ON projects
  USING (owner_id = current_setting('app.current_user_id')::uuid);
```

```ruby
# app/policies/project_policy.rb
class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Set the current_user in Postgres and let RLS do the heavy lifting
      ActiveRecord::Base.connection.execute(
        "SET app.current_user_id = '#{user.id}'"
      )
      scope.all
    end
  end
end
```

This offloads filtering into the database, scales to millions of rows, and ensures policy constraints are enforced even in complex SQL joins or background jobs.