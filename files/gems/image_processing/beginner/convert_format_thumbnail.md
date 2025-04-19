## 🎨 Convert formats and create thumbnails

You can convert images to different formats or apply operations like cropping. Combine options like `format` and `resize_to_fill` to generate square thumbnails.

```ruby
# In a model or controller
def avatar_thumbnail
  user.avatar.variant(format: :png, resize_to_fill: [100, 100]).processed
end
```

Use the resulting variant in views to serve optimized thumbnails.