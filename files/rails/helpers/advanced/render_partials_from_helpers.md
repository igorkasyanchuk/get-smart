## 🔄 Rendering Partials with Dynamic Locals from Helpers

Invoke `render` directly in a helper to consolidate repeated partial logic. Pass in collections, locals, or dynamic partial paths to keep views DRY and maintainable.

```ruby
# app/helpers/comments_helper.rb
module CommentsHelper
  def comment_list(comments)
    render partial: 'comments/comment', collection: comments, as: :comment
  end

  def dynamic_comment_view(comment, view_name)
    partial = "comments/#{view_name}"
    render partial: partial, locals: { comment: comment }
  end
end
```
