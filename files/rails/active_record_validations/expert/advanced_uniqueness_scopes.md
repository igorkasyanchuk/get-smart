## 🔍 Advanced Uniqueness with Scopes and Subqueries
Enforce uniqueness with complex scopes or dynamic conditions by combining `uniqueness` validator with `where` subqueries. This is essential for multitenant apps and soft-deletion logic.

```ruby
# app/models/project.rb
class Project < ApplicationRecord
  validates :name,
    uniqueness: { 
      scope: :account_id,
      conditions: -> { where(archived: false) }
    }
end

# Ensure DB-level partial index too
add_index :projects, [:account_id, :name], unique: true, where: "archived = FALSE"
```