## 🔍 Use Shallow Routing to Avoid Deep Nesting
Deeply nested resources can lead to unwieldy URLs and complicated controller logic. Shallow routing extracts member routes out of nested blocks, keeping only collection routes nested. This makes helpers simpler and controllers cleaner.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :authors, shallow: true do
    resources :books do
      resources :chapters
    end
  end
end

# Generated routes:
# author_books   GET    /authors/:author_id/books
# book_path      GET    /books/:id
# book_chapters  GET    /books/:book_id/chapters
# chapter_path   GET    /chapters/:id
```

Shallow routing reduces URL depth while retaining logical grouping.