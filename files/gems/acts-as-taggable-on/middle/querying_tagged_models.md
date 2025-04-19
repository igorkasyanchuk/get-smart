## 🔍 Querying Tagged Models

Use helper scopes to fetch records tagged with one or multiple tags. `tagged_with` supports parameters like `any: true` or `exclude` for flexible queries.

```ruby
# Find posts tagged with both "rails" and "testing"
Post.tagged_with(['rails', 'testing'], on: :tags)

# Find posts tagged with any of the given tags
Post.tagged_with(['backend', 'api'], on: :tags, any: true)

# Exclude posts with a specific tag
Post.tagged_with('deprecated', on: :tags, exclude: true)
```

You can also chain with ActiveRecord for pagination or ordering:

```ruby
Post.tagged_with('ruby', on: :tags).order(created_at: :desc).limit(10)
```