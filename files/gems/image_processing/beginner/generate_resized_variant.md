## 🔄 Generate resized image variants

Use the `variant` method on Active Storage attachments to create resized versions of your images. Variants are processed lazily and stored, so repeated requests use the cached version.

```erb
<%= image_tag user.avatar.variant(resize_to_limit: [150, 150]) %>
```

Adjust the dimensions to maintain aspect ratio within the specified limit.