## 📜 Leverage policy_scope in Index Actions

Pundit's `policy_scope` helps you filter records a user is allowed to view. Instead of fetching all records, use `policy_scope` in your controller's `index` action to apply the policy scope automatically.

```ruby
class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    # Only returns articles the user is authorized to see
    @articles = policy_scope(Article)
  end
end
```

Then define the scope in `ArticlePolicy`:

```ruby
class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end
end
```