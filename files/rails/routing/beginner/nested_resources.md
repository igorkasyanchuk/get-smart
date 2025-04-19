## 🌲 Nest related resources for hierarchical URLs

When resources logically belong to another, you can nest them to reflect this relationship in your URLs. This is useful for comments under articles, photos in albums, etc. It also scopes controllers to parent objects.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:index, :create, :destroy]
  end
end
```

Generated routes include `article_comments_path(@article)` and `article_comment_path(@article, @comment)`, making it clear which article a comment belongs to.