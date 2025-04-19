## 🔍 Use `policy_scope` in Controllers
Using `policy_scope` ensures you only fetch records the current user is allowed to see. Define a `Scope` class in your policy to centralize filtering logic and avoid leaking unauthorized data.

```ruby
class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post)
  end
end
```

```ruby
class PostPolicy < ApplicationPolicy
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
