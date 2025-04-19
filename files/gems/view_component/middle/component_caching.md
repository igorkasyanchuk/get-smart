## 🗄️ Leveraging Fragment Caching in Components

Integrate Rails fragment caching inside your component to speed up rendering of static content. Use a unique cache key to invalidate appropriately.

```ruby
# app/components/latest_posts_component.rb
class LatestPostsComponent < ViewComponent::Base
  def call
    cache([:latest_posts, Post.maximum(:updated_at)]) do
      render PostsListComponent.new(posts: Post.recent.limit(5))
    end
  end
end
```

This caches the rendered list until any post’s `updated_at` changes.