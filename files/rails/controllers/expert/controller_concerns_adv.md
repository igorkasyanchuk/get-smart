## 🧩 Advanced Controller Concerns for Cross‐Cutting Logic

Extract complex before/after callbacks, parameter sanitization and shared utilities into concerns. Use `included do` and `ClassMethods` to inject actions, scopes, or filters at the class level, keeping controllers DRY and expressive.

```ruby
# app/controllers/concerns/audit_trail.rb
module AuditTrail
  extend ActiveSupport::Concern

  included do
    before_action :record_audit
  end

  private

  def record_audit
    Audit.create!(user: current_user, path: request.fullpath)
  end

  module ClassMethods
    def skip_audit_for(*actions)
      skip_before_action :record_audit, only: actions
    end
  end
end

# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  include AuditTrail
  skip_audit_for :index, :show
end
```