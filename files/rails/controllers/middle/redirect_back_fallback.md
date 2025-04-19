## 🔙 Use redirect_back with fallback_location
`redirect_back` lets you send users to the page they came from, improving UX after form submissions or actions. Always provide a `fallback_location` to handle cases where the referrer is absent. This avoids routing errors and gracefully handles direct visits.

```ruby
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Comment created.')
    else
      redirect_back(fallback_location: root_path, alert: 'Failed to save comment.')
    end
  end
end
```