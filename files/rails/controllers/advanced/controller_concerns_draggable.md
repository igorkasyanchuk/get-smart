## 🧠 Use Controller Concerns for DRY Action Logic
Extract shared controller code into concerns to keep controllers focused and maintainable. For example, handling record lookup and authorization across multiple controllers.

```ruby
# app/controllers/concerns/load_and_authorize.rb
module LoadAndAuthorize
  extend ActiveSupport::Concern

  included do
    before_action :set_resource, only: [:show, :update, :destroy]
    before_action :authorize_resource
  end

  private

  def set_resource
    @resource = controller_name.classify.constantize.find(params[:id])
  end

  def authorize_resource
    authorize @resource
  end
end
```

Then include it in your controllers:
```ruby
class ArticlesController < ApplicationController
  include LoadAndAuthorize
  # all show/update/destroy automatically load and authorize @resource
end
```