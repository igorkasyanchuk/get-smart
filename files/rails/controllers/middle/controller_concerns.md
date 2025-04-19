## 🧩 Extract Logic with Controller Concerns
Controller concerns let you share common behavior across multiple controllers without inheritance. Define a module under `app/controllers/concerns` and include it where needed. This promotes separation of concerns and keeps controllers focused.

```ruby
# app/controllers/concerns/paginatable.rb
module Paginatable
  extend ActiveSupport::Concern

  def paginate(resource)
    resource.page(params[:page]).per(10)
  end
end

# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  include Paginatable

  def index
    @posts = paginate(Post.all)
  end
end
```