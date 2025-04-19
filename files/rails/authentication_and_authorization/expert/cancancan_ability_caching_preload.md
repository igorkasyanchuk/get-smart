## ⚡ Cache and Preload Permissions in Cancancan for High-Volume Queries

When serving large data sets, repeatedly evaluating `current_ability.can?` or using `accessible_by` can be a bottleneck. You can serialize and cache the user’s Ability object in Redis, and preload IDs via single optimized SQL for bulk authorization. This minimizes Ruby-level checks and dramatically reduces query count.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  def current_ability
    Rails.cache.fetch([:ability, current_user.id], expires_in: 10.minutes) do
      Ability.new(current_user)
    end
  end
end
```

```ruby
# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      # Preload allowed project IDs in one go
      project_ids = Project.where(public: true)
                           .or(Project.where(owner_id: user.id)).pluck(:id)
      can :read, Project, id: project_ids
      # further rules...
    end
  end
end
```

This approach consolidates permission evaluation into a single SQL pluck and reuses the compiled Ability, dramatically speeding up index actions or GraphQL batch loads.