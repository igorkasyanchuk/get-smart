## ✨ Using `find_or_create_by`

`find_or_create_by` attempts to find a record with the given attributes, and if none exists, it creates one. This is useful for idempotent operations, such as seeding default values or ensuring uniqueness without race conditions in simple scenarios.

```ruby
# Find or create a tag named 'ruby'
tag = Tag.find_or_create_by(name: 'ruby')
```